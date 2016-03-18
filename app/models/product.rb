class Product < ActiveRecord::Base
  belongs_to :type

  def self.search(keyword)
    where("name LIKE ?", "%#{keyword}%") 
  end
end
