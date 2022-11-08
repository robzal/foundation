variable "customer_prefix" {
  type        = string
  description = "Prefix for all resources with the customer name. Should be lower case characters starting with an alpha character and be consistent across the environment. Only `-` as a special character."
}
