## **AWS Backup**

### **Organization Backups**

AWS Backup is configured on an organization level. All AWS Backup Lifecycles changes such as backup times, Vaults and Tags should be done at the Organization Level in the relevant Regions Policy. All backup policies have been applied to the Operational Target OU. The following diagram outlines the Organization architecture for AWS Backup.

![Alt text](./images/AWSBackup.png?raw=true "AWS Backup")

### *Backup Policy*
![Alt text](./images/AWSBackupPolicy.png?raw=true "AWS Backup Policy")

### **AWS Backup Plans**

Below AWS Backup Plans have been configured.
| Backup rule Name |   Schedule  | Retention Period |
|------------------|-------------|------------------|
| daily_backup     | 15:00 Hrs UTC Daily                       | 1 Month  |
| weekly_backup    | 18:00 Hrs UTC Every Sunday                | 6 Weeks  |
| monthly_backup   | 21:00 Hrs UTC 1st Sunday of every month   | 365 Days |
| yearly_backup    | 15:00 Hrs UTC 1st January                 | 7 Years  |

### *Resource Tagging*
Ensure the supported AWS resources have the correspondinbg Tags added for the desired backup schedule. Below is an exmaple for the EC2 resource that is tagged for daily backup, a resource can be tagged with multiple backup schedules.
![Alt text](./images/AwsBackupTag.png?raw=true "AWS Backup Tag")

