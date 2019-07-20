class Micropost < ApplicationRecord
  default_scope -> { order(created_at: :desc)}
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  private

  def picture_size
    if picure.size > 5.megabytes
      errors.add(:picture,  "should be less than 5MB")
    end
  end
end
