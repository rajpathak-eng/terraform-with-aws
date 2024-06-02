variable "aws_region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "index_document" {
  description = "S3 bucket website index document"
  default     = "index.html"
}

variable "error_document" {
  description = "S3 bucket website error document"
  default     = "error.html"
}
