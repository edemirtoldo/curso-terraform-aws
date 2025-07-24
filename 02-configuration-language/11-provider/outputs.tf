output "buckets" {
  value = {
    n_virginia = aws_s3_bucket.bucket.id
    sao_paulo = aws_s3_bucket.bucket_sao_paulo.id
  }
}
