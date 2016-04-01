class Service < ActiveRecord::Base
  has_many :type_services, dependent: :destroy
  has_many :types, through: :type_services
end
