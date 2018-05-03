class News < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates_presence_of :image
  validate :image_size_validation

  private
  def image_size_validation
    error[:image] << "Rozmiar obrazu nie powinien przekraczać 1 MB" if image.size > 1.megabytes
  end
end
