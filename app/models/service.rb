class Service < ActiveRecord::Base
  has_many :type_services, dependent: :destroy
  has_many :types, through: :type_services

  def all_types
    types_arr = []
    types_id = []
    self.types.each do |type|
      types_arr << type.name
      types_id << type.id
    end
    types_name = types_arr.join(' , ')
    {ids: types_id, names: types_name}
  end
end
