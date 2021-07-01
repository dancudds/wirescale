resource "random_string" "random" {
  length  = 6
  special = false
}
resource "aws_secretsmanager_secret" "keycloak_password" {
  name = random_string.random.result
}
resource "aws_secretsmanager_secret_version" "keycloak_password" {
  secret_id     = aws_secretsmanager_secret.keycloak_password.id
  secret_string = var.keycloak_password
}