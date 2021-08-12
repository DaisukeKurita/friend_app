class Feed < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :content, presence: true
  validates :image, presence: true
end
