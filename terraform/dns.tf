resource "aws_route53_record" "keycloak" {
  zone_id = var.dns_hostedzone
  name    = var.domainname
  type    = "A"

  alias {
    name                   = aws_lb.lb.dns_name
    zone_id                = aws_lb.lb.zone_id
    evaluate_target_health = false
  }
}