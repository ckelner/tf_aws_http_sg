#############################################################################
# Resources
#############################################################################
#
# Security Group
# https://www.terraform.io/docs/providers/aws/r/security_group.html
#
resource "aws_security_group" "sg" {
  name_prefix = "${var.name_prefix}"
  description = "${var.description}"
  vpc_id      = "${var.vpc_id}"
  tags        = "${var.tags}"
}
#
# Security Group Rules
# https://www.terraform.io/docs/providers/aws/r/security_group_rule.html
#
resource "aws_security_group_rule" "inbound_http_from_anywhere" {
  type            = "ingress"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.sg.id}"
}
resource "aws_security_group_rule" "outbound_internet_to_anywhere" {
  type            = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  cidr_blocks     = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.sg.id}"
}
#############################################################################
# Variables
#############################################################################
variable "name_prefix" {
  description = "The name prefix to use with the security group"
  default = ""
}
variable "description" {
  description = "The description for the security group"
  default = "HTTP access from the world"
}
variable "vpc_id" {
  description = "The VPC to create the security group in"
}
variable "tags" {
  description = "Tags to apply to the security group"
  default = {}
}
#############################################################################
# Outputs
#############################################################################
output "id" {
    value = "${aws_security_group.sg.id}"
}
output "vpc_id" {
    value = "${aws_security_group.sg.vpc_id}"
}
output "name" {
    value = "${aws_security_group.sg.name}"
}
