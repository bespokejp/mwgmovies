# == Schema Information
#
# Table name: users
#
#  id                              :bigint(8)        not null, primary key
#  email                           :string           not null
#  crypted_password                :string
#  salt                            :string
#  name                            :string           not null
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  remember_me_token               :string
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string
#  reset_password_token_expires_at :datetime
#  reset_password_email_sent_at    :datetime
#  activation_state                :string
#  activation_token                :string
#  activation_token_expires_at     :datetime
#  role                            :integer          default("member"), not null
#  bio                             :text
#  avatar                          :string
#

class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  authenticates_with_sorcery!

  validates :password, length: {minimum: 8}, if: -> { new_record? || changes[:crypted_password] }
  validates :password, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password, format: {with: /\A[A-Za-z!-9@_]*\z/}, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true

  enum role: {
    member: 1,
    presenter: 2,
    admin: 3
  }

  has_many :payments

  def is_admin?
    self.admin? || self.presenter?
  end

  def purchased?(room_id)
    self.payments.find_by(room_id: room_id)
  end

  def purchased_rooms
    Room.where(id: self.payments.pluck('room_id'))
  end
end

