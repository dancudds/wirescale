resource "aws_network_interface" "keycloakeni" {
  subnet_id       = aws_subnet.public.id
  security_groups = [aws_security_group.allow_http.id]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_network_interface" "wireguard" {
  subnet_id       = aws_subnet.public.id
  security_groups = [aws_security_group.allow_http.id]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_network_interface" "nginx" {
  subnet_id       = aws_subnet.private.id
  security_groups = [aws_security_group.allow_http.id]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "keycloak" {
  ami           = "ami-09c433ba8d9313097"
  instance_type = "t2.micro"
  network_interface {
    network_interface_id = aws_network_interface.keycloakeni.id
    device_index         = 0
  }


  tags = {
    Name = "WireScale - Keycloak"
  }
}

resource "aws_instance" "wireguard" {
  ami           = "ami-09c433ba8d9313097"
  instance_type = "t2.micro"
  network_interface {
    network_interface_id = aws_network_interface.wireguard.id
    device_index         = 0
  }


  tags = {
    Name = "WireScale - WireGuard"
  }
}

resource "aws_instance" "nginx" {
  ami           = "ami-09c433ba8d9313097"
  instance_type = "t2.micro"
  network_interface {
    network_interface_id = aws_network_interface.nginx.id
    device_index         = 0
  }


  tags = {
    Name = "WireScale - Nginx"
  }
}