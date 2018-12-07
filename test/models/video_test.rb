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

require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
