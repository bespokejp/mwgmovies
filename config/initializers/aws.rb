Aws.config.update({
  region: 'ap-northeast-1',
  credentials: Aws::Credentials.new(
    Rails.application.credentials.dig(:aws, :access_key_id),
    Rails.application.credentials.dig(:aws, :secret_access_key)
  ),
})
S3_BUCKET = Aws::S3::Resource.new.bucket('mwgmovies')
S3_BUCKET_HLS = Aws::S3::Resource.new.bucket('mwgmovies-hls')
