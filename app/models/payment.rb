# == Schema Information
#
# Table name: payments
#
#  id         :bigint(8)        not null, primary key
#  charge_id  :string           not null
#  user_id    :integer          not null
#  room_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Payment < ApplicationRecord
  belongs_to :room
  belongs_to :user
end
