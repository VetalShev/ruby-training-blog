class Article < ApplicationRecord

  mount_uploader :image, ImageUploader

  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true,
                    length: { minimum: 5 }

  validates_processing_of :image
  validate :image_size_validation
  
  private
  def image_size_validation
    errors[:image] << 'The image size should be less then 1Mb' if image.size > 1.megabytes
  end

end
