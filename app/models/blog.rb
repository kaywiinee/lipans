class Blog < ActiveRecord::Base
  belongs_to :type
  has_one :image, class_name: 'ImageType::Blog', as: :parent, dependent: :destroy, :autosave => true
  
  scope :displayed, ->() { where(is_displayed: true) }
  
  def image
    super || build_image
  end

  def image_title(size=:original)
    self.image.image.url(size)
  end

  def image=(image_binary)
    self.build_image unless self.image
    self.image.image = image_binary
  end
end
