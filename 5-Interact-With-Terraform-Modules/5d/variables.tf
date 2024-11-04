variable "bucket_name" {
  description = "Name of S3 bucket for the website"
  type        = string
}

variable "tags" {
  description = "Tags for the bucket"
  type        = map(string)
  default     = {}
}

variable "create_random_suffix" {
  description = "Add random suffix to bucket name"
  type        = bool
  default     = false
}

variable "environment" {
  description = "Environment bucket resides in"
  type        = string
}
