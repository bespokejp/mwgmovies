# == Schema Information
#
# Table name: videos
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  s3_key     :string
#  room_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  thumbnail  :string
#

class Video < ApplicationRecord
  mount_uploader :thumbnail, ThumbnailUploader

  belongs_to :room
  accepts_nested_attributes_for :room

  def stream_url
    prefix = "https://s3-ap-northeast-1.amazonaws.com/mwgmovies-hls/#{ENV["SERVER_STAGE"]}/stream/"
    "#{prefix}#{self.s3_key}/index.m3u8"
  end
end
