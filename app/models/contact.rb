class Contact < ActiveRecord::Base
  validates :name, :message, :presence => true
  validates :email, :presence => true, :email => true
end
