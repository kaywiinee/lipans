class ImageType::Blog < Image
  has_attached_file :image,{
      :default_url => :default_url,
      :styles => {
        small: ['100x100#', :png],
        original: ['600x250#',:png]
      },
      :url => "/system/:class/:attachment/:id/:style/:basename.:extension",
      :path => ":rails_root/public/system/:class/:attachment/:id/:style/:basename.:extension"
  }
  def default_url
    ActionController::Base.helpers.asset_path('common/noimage.jpeg')
  end
end