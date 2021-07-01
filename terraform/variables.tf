variable "acm_arm" {
  description = "ARN of ACM for ELB"
  type        = string
  default     = "arn:aws:acm:us-west-2:410789117334:certificate/e25d5fe8-d386-42ea-b386-055c267f450f"
}
variable "keycloak_password" {
  description = "Initial value of Keycloak user password"
  type        = string
  sensitive   = true
}
variable "dns_hostedzone" {
  description = "Hosted Zone ID of domain name to modify"
  type        = string
  default     = "Z156120MQA54SL"
}
variable "domainname" {
  description = "domainname with Hosted Zone to modify with LB address (should match ACM CN)"
  type        = string
  default     = "keycloak.cuddeford.com"
}
