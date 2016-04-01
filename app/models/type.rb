class Type < ActiveRecord::Base
  has_many :products
  has_many :type_services, dependent: :destroy
  has_many :services, through: :type_services

  scope :kind, ->(kind) { where(kind: kind) }
  scope :displayed, ->() { where(is_displayed: true) }
end
