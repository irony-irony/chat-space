CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['aws_access_key_id'],
    aws_secret_access_key: ENV['aws_secret_access_key'],
    region: 'ap-northeast-1'
  }

  case Rails.env
    when 'production'
      config.storage :fog
      config.fog_directory = 'chatspaceimage'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/chatspaceimage'

    when 'development'
      config.storage :fog
      config.fog_directory = 'chatspaceimage'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/chatspaceimage'

    when 'test'
      config.storage = :file
  end
end
