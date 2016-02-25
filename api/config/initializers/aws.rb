require 'aws-sdk'

secrets = Rails.application.secrets

Aws.config[:stub_responses] = true if Rails.env.test?
Aws.config[:credentials] = Aws::Credentials.new(
                              secrets.s3_access_key_id,
                              secrets.s3_secret
                           )

Aws.config[:region] = secrets.s3_region
Aws.config[:log_level] = Rails.logger.log_level
Aws.config[:logger] = Rails.logger
