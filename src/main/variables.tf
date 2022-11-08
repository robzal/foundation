variable "customer_prefix" {
  type        = string
  default     = "worxdesign"
  description = "Prefix for all resources with the customer name. Should be lower case characters starting with an alpha character and be consistent across the environment. Only `-` as a special character."
}

variable "aws_account_budget" {
  type        = number
  default     = 500
  description = "Amount to alert when the bill for the whole AWS Organization will exceed on current forecast or has exceeded."
}

variable "aws_account_budget_notification_email_address" {
  type        = list(string)
  description = "Email address to alert when the bill for the whole AWS Organization will exceed on current forecast or has exceeded."
}

variable "primary_region" {
  type        = string
  description = "Primary AWS Region to deploy resources into"
  default     = "ap-southeast-2"
}

variable "secondary_regions" {
  type        = list(string)
  description = "Regions to be enabled for use. Defaults to empty list."
  default     = []
}

variable "operations_contact" {
  type        = map(string)
  description = "Map with email address, phone number, name and title for accounts operations contact"
  default = {
    "email"        = ""
    "phone_number" = ""
    "name"         = ""
    "title"        = ""
  }
}

variable "billing_contact" {
  type        = map(string)
  description = "Map with email address, phone number, name and title for accounts billing contact"
  default = {
    "email"        = ""
    "phone_number" = ""
    "name"         = ""
    "title"        = ""
  }
}

variable "security_contact" {
  type        = map(string)
  description = "Map with email address, phone number, name and title for accounts security contact"
  default = {
    "email"        = ""
    "phone_number" = ""
    "name"         = ""
    "title"        = ""
  }
}
