CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     'AKIAJ6X6UZGXWUINARPQ',
      aws_secret_access_key: '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',
      region:                ENV['S3_REGION']
  }
  config.fog_directory  = ENV['S3_BUCKET']
end
