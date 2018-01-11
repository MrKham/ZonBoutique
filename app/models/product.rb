class Product < ApplicationRecord
  mount_uploader :picture, PictureUploader
  validate  :picture_size
  belongs_to :trademark
  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
