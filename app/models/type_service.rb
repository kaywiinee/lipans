class TypeService < ActiveRecord::Base
  belongs_to :type
  belongs_to :service
end
