require "refile/s3"

secrets = Rails.application.secrets

aws = {
  access_key_id: secrets.s3_access_key_id,
  secret_access_key: secrets.s3_secret,
  region: secrets.s3_region,
  bucket: secrets.s3_bucket
}

Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
