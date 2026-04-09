resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  vpc_id      = var.vpc_id
  description = "Allow access public from internet"
  #checkov:skip=CKV2_AWS_5: SG is attached to EC2 via module input
}

resource "aws_security_group_rule" "ingress_rules" {
  count = length(var.sg_ingress_rules)

  type              = "ingress"
  from_port         = var.sg_ingress_rules[count.index].from_port
  to_port           = var.sg_ingress_rules[count.index].to_port
  protocol          = var.sg_ingress_rules[count.index].protocol
  cidr_blocks       = [var.sg_ingress_rules[count.index].cidr_block]
  description       = var.sg_ingress_rules[count.index].description
  security_group_id = aws_security_group.web_sg.id
}

resource "aws_security_group_rule" "egress_rules" {
  count = length(var.sg_egress_rules)

  type              = "egress"
  from_port         = var.sg_egress_rules[count.index].from_port
  to_port           = var.sg_egress_rules[count.index].to_port
  protocol          = var.sg_egress_rules[count.index].protocol
  cidr_blocks       = [var.sg_egress_rules[count.index].cidr_block]
  description       = var.sg_egress_rules[count.index].description
  security_group_id = aws_security_group.web_sg.id
}