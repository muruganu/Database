#-----DB Group-------------

resource "aws_security_group" "db_sg" {
  name        = "rds_sg"
  description = "Used for the elastic load balancer for public access"
  vpc_id      = var.vpc_id

  #HTTP
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Rds SG"
  }
}