class Api::V1Controller < ApiController

  # get list services
  # params {page}
  def api1
    limit = params[:limit].to_i.abs > 0 ? params[:limit].to_i.abs : 10
    page = params[:page].to_i.abs > 0 ? params[:page].to_i.abs : 1
    
    services = []
    Service.page(page).per(limit).each do |service|
      service_json = service.as_json
      service_json['types'] = service.all_types
      services << service_json
    end
    is_full = services.length%10 == 0 ? 1 : 0
    total = (Service.all.length.to_f/limit).ceil
    render_success ({services: services, total: total, is_full: is_full})
  end

  # get list types
  def api2
    types = Type.kind('service')
    types = types.displayed if params[:all].nil?
    render_success(types)
  end

  # create new service
  # params {name, price, description, is_displayed, types[array]}
  def api3
    render_failed(3,'Chưa nhập tên') and return if params[:name].nil?
    render_failed(4,'Chưa nhập giá') and return if params[:price].nil?
    render_failed(5,'Chưa nhập mô tả') and return if params[:description].nil?
    render_failed(6,'Chưa chọn ẩn hiện') and return if params[:is_displayed].nil?
    render_failed(7,'Chưa chọn loại dịch vụ') and return if params[:types_id].nil? || params[:types_id].blank?

    service_params = params.permit(:name, :price, :description, :is_displayed)
    service = params[:id].present? ? Service.find_by_id(params[:id]) : Service.new()
    service.attributes = service_params

    service.type_services.delete_all if service.type_services.present?
    params[:types_id].each {|type_id| service.type_services.build(type_id: type_id)}
    service.save! unless service.invalid?

    render_success({})
  end

  # delete service
  # params {servers_id[array]}
  def api4
    render_failed_by_missing_params('Chưa chọn dịch vụ cần xóa') and return if params[:services_id].nil? || params[:services_id].blank?
    Service.where(id: params[:services_id]).destroy_all
    render_success({})
  end
end