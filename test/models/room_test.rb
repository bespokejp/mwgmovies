# == Schema Information
#
# Table name: rooms
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  headline    :string
#  description :text
#  price       :integer
#  youtube     :string
#  background  :string
#  package     :string
#  images      :json
#

require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
