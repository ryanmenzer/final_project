CarrierWave.configure do |config|
  # config.permissions = 0666
  # config.directory_permissions = 0777
  # config.storage = :file

  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAICZOFKP7CLQL7O7A',                        # required
    :aws_secret_access_key  => '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'                       # required
    # :region                 => 'eu-west-1',                  # optional, defaults to 'us-east-1'
    # :host                   => 's3.example.com',             # optional, defaults to nil
    # :endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'oliwi_org'                     # required
  # config.fog_public     = true                                   # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
