output "bucket_id" {
  description = "The id of the bucket"
  value       = aws_s3_bucket.website.id
}

output "bucket_arn" {
  description = "The arn of the bucket"
  value       = aws_s3_bucket.website.arn
}

output "bucket_website_endpoint" {
  description = "The website endpoint of the bucket"
  value       = aws_s3_bucket_website_configuration.website.website_endpoint
}
