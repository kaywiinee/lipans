class Contact < ActiveRecord::Base
  include Humanizer
  require_human_on :create
  validates :name, :message, :presence => true
  validates :email, :presence => true, :email => true
end
