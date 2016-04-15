class Type < ActiveRecord::Base
  has_many :products
  has_many :type_services, dependent: :destroy
  has_many :services, through: :type_services
  has_one :image, class_name: 'ImageType::Service', as: :parent, dependent: :destroy, :autosave => true
  has_many :blogs

  scope :kind, ->(kind) { where(kind: kind) }
  scope :displayed, ->() { where(is_displayed: true) }

  def image
    super || build_image
  end

  def image_url(size=:original)
    self.image.image.url(size)
  end

  def image=(image_binary)
    self.build_image unless self.image
    self.image.image = image_binary
  end
  
end
