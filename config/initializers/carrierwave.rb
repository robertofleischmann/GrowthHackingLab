CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp') # adding these...
  config.cache_dir = 'carrierwave' # ...two lines
  config.storage = :fog

  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJJQVJXTMFNOMIMFQ',                        # required
    :aws_secret_access_key  => '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',                        # required
    # :region                 => 'us-west-2',                  # optional, defaults to 'us-east-1'
    # :endpoint               => 'http://s3-website-us-east-1.amazonaws.com'
  }
  config.fog_directory  = 'growthhackinglab'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end