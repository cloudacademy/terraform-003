variable "security_group" {
  description = "Security group configuration"
  type = object({
    name        = string
    description = string
    vpc_id      = string
    ingress_rules = list(
      object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
      })
    )
  })
}
