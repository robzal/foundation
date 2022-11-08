## **Remote Access over SSM**
SSH/RDP can be enabled on the EC2 instance without opening port 22/3389 to the network or requiring a bastion host or VPN. This is a secure way to connect to EC2 instances. Below is the The general architecture.
![Alt text](./images/sshoverssm.png?raw=true "SSH Over SSM")

#### Prerequisits
* Local Setup
  * [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
    * MacOS `brew install awscli` 
    * Windows `winget install Amazon.AWSCLI` 
  * [Install AWS CLI Session Manager Plugin](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html)
    * MacOS `brew install session-manager-plugin`
    * Windows `winget install Amazon.SessionManagerPlugin`   

  * [Configure the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html)
    * The AWS config file should have the configuration for the Roles that the credentials can assume for respective Operational account. Below is an example config. This file is located at `~/.aws/config`
        ```
            [profile my-aws-production]
            sso_start_url = https://my-sso-portal.awsapps.com/start
            sso_region = ap-southeast-2
            sso_account_id = 123456789
            sso_role_name = AdminRole
            output = json
        ``` 
  * Setup SSH Config
    * A ProxyCommand directive needs to be set in the relevant .ssh config file. This file is located at: `~/.ssh/config`. This includes a port fowarding that can be used for connecting to an RDS instance locally using SSM tunneling. Below is an example config.
    * MacOS
        ```
        host i-*^production mi-*^prod
                ProxyCommand sh -c "aws ssm start-session --target $(echo %h | cut -d^ -f1) --document-name AWS-StartSSHSession --parameters 'portNumber=%p' --profile my-aws-production"
                LocalForward 7001 127.0.0.1:5901
                LocalForward 7002 127.0.0.1:5902
                LocalForward 7003 127.0.0.1:3389
        ```
    * Windows
        ```
        host i-*^sandpit mi-*^prod
                ProxyCommand C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe "aws ssm start-session --target $(echo '%h' | %%{$_.split('^')[0]}) --document-name AWS-StartSSHSession --parameters portNumber=%p --profile my-aws-production"
                LocalForward 7001 127.0.0.1:5901
                LocalForward 7002 127.0.0.1:5902
                LocalForward 7003 127.0.0.1:3389
        ```

* Ensure Your IAM Permissions
  * [IAM Policy Example](aws-ssm-ec2-iam-policy.json)
  * `ssm:StartSession` for DocumentName: `AWS-StartSSHSession` and Target Instance
    * [AWS Documentation](https://docs.aws.amazon.com/systems-manager/latest/userguide/getting-started-restrict-access-examples.html)
  * `ssm:SendCommand` for DocumentName: `AWS-RunShellScript` and Target Instance
    * [AWS Documentation](https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-rc-setting-up.html)

* Target Instance Setup
  * [Ensure SSM Permissions](https://docs.aws.amazon.com/systems-manager/latest/userguide/setup-instance-profile.html) for Target Instance Profile
  * Ensure SSM Agent is installed (some standard AWS AMIs will have the SSM agent preinstalled)
    * [Install SSM Agent on Linux Instances](https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-install-ssm-agent.html)
      * `yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm & service amazon-ssm-agent restart`
    * [SSM Agent on Windows Instances](https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-install-ssm-win.html)
  

#### Connecting to EC2 Instance
To connect to an EC2 instance in an environment, the EC2 instance id will need to be known. This can be retrieved from the EC2 console in the respective account and region. 
* AWS SSO Login - Login to specific account using the profile name setup in the AWS config.
  * `aws sso login --profile profile-name`
  * e.g. `aws sso login --profile my-aws-production`
* SSH Command:
  * `ssh -i <location of your PEM KEY> <user>@<ec2instance-id>^<env>`
  * e.g. `ssh -i ./my-key.pem ec2-user@i-01d3461cf6d6c179d^prod`

#### Connecting to RDS through SSM Tunneling
SSM Tunneling can be used to conenct to RDS instance deployed in a private subnet through an EC2 instance port forwarding. Make sure the RDS security group allows the EC2 instance security group on the respective DB port.
  * RDS Tunneling Command:
  * `ssh -i <location of your PEM KEY> -L <local-port>:<Host-Address>:<remoteport> <user>@<ec2instance-id>^<env>`
  ```
    <location of your PEM KEY> - SSH Key for connecting to the EC2 instance
                  <local-port> - Any desired local port
                <Host-Address> - Host Address ex:- RDS Endpoint
                  <remoteport> - Remote Port number ex:- RDS Port number
                        <user> - EC2 user ex:- ec2-user
              <ec2instance-id> - EC2 Instance ID
                         <env> - Account Alias ex:- prod, dev, test
  ```
  * e.g. `ssh -i ./my-key.pem -L 15333:my-rds-aurora-cluster-dev.cluster-cbvopoyrfoot.ap-southeast-2.rds.amazonaws.com:3306 ec2-user@i-01d3461cf6d6c179d^prod`
