resource "aws_security_group" "security_group" {
  name   = var.security_group_name
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.resource_prefix}-sg"
  }
}

resource "aws_security_group_rule" "security_group_rule" {
  for_each = { for k, v in var.security_group_rules : k => v }

  security_group_id        = aws_security_group.security_group.id
  protocol                 = try(each.value.protocol, "tcp")
  from_port                = try(each.value.from_port, 443)
  to_port                  = try(each.value.to_port, 443)
  type                     = try(each.value.type, "ingress")
  description              = try(each.value.description, null)
  cidr_blocks              = lookup(each.value, "cidr_blocks", null)
}