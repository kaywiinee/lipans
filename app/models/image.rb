class Image < ActiveRecord::Base
  has_attached_file :image
  # polymorphic
  belongs_to :parent, :polymorphic => true
  delegate :url, to: :image
  
  after_validation :errors_compact
  
  validates_attachment_size :image, :less_than => 25.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/x-png', 'image/gif','application/x-shockwave-flash']

  # Multiple error measures TODO:Survey
  def errors_compact
    self.errors.messages.delete(:image_file_size)
    self.errors.messages.delete(:image_content_type)
  end

  def self.default_url
    "common/noimage.jpeg"
  end

  def default_url
    Image.default_url
  end
end
