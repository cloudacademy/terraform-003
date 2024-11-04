variable "cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "tags" {
  description = "The VPC tags"
  type        = map(string)
  default     = {}
}

# ===================

resource "aws_vpc" "vpc1" {
  cidr_block = var.cidr
  tags       = var.tags
}

# ===================

output "vpc_id" {
  value = aws_vpc.vpc1.id
}
