variable "access_key" {
  type    = string
  default = ""
}
variable "secret_key" {
  type    = string
  default = ""
}
variable "location" {
  type    = string
  default = "us-east-1"
}
variable "bucket_name" {
  type    = string
  default = "my-tf-test-bucket"
}
variable "environment" {
  type    = string
  default = "dev"
}
