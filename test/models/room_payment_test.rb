# == Schema Information
#
# Table name: room_payments
#
#  id         :bigint(8)        not null, primary key
#  charge_id  :string           not null
#  user_id    :integer          not null
#  room_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RoomPaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
