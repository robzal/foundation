variable "customer_prefix" {
  type        = string
  default     = "TEMPLATE_CUSTOMER_PREFIX"
  description = "Prefix for all resources with the customer name. Should be lower case characters starting with an alpha character and be consistent across the environment. Only `-` as a special character."
}

variable "security_notification_emails" {
  type        = list(string)
  description = "List of email addresses to email security issues to."
}
