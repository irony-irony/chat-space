CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'fuck_you_so_much',
    aws_secret_access_key: 'in_your_face_asshole',
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
