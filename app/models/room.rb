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

class Room < ApplicationRecord
  mount_uploader :package, PackageUploader
  mount_uploaders :images, ImageUploader

  has_many :videos
  has_many :payments

  def is_free?
    self.price.nil? || self.price.zero?
  end
end
