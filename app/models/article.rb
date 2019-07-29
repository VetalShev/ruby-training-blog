class Article < ApplicationRecord

  mount_uploader :image, ImageUploader

  has_many :comments, dependent: :destroy

  validates :title, presence: true,
                    length: { minimum: 5 }

  validates_processing_of :image
  validate :image_size_validation
  
  private
  def image_size_validation
    errors[:image] << 'The image size should be less then 500Kb' if image.size > 0.5.megabytes
  end

end
