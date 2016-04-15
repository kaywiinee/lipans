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
  # params {type}
  def api2
    render_failed_by_missing_params('Thiếu biến') and return if params[:type].nil?
    types = Type.kind(params[:type])
    types = types.displayed if params[:all].nil?
    render_success(types)
  end

  # create or update service
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

  # create or update type
  # params {name, is_displayed, image}
  def api5
    render_failed(3,'Chưa nhập tên') and return if params[:name].nil?
    render_failed(4,'Chưa chọn ẩn hiện') and return if params[:is_displayed].nil?
    render_failed(5,'Chưa chọn hình') and return if params[:image_url].nil?

    if params[:id].present?
      type = Type.find_by_id(params[:id])
      type.name = params[:name]
      type.is_displayed = params[:is_displayed].to_i
      type.image.image = params[:image_url]
    else
      type = Type.new(
        name: params[:name],
        is_displayed: params[:is_displayed].to_i,
        kind: 'service',
        image: params[:image_url]
      )
    end

    type.save! unless type.invalid?
    render_success({})
  end

  # get list blogs
  # params {page}
  def api6
    limit = params[:limit].to_i.abs > 0 ? params[:limit].to_i.abs : 10
    page = params[:page].to_i.abs > 0 ? params[:page].to_i.abs : 1
    
    blogs = []
    Blog.page(page).per(limit).each do |blog|
      blog_json = blog.as_json
      blog_json['type'] = blog.type
      blogs << blog_json
    end
    is_full = blogs.length%10 == 0 ? 1 : 0
    total = (Service.all.length.to_f/limit).ceil
    render_success ({blogs: blogs, total: total, is_full: is_full})
  end

  # create or update blog
  # params {name, price, description, is_displayed, types[array]}
  def api7
    render_failed(3,'Chưa nhập tiêu đề') and return if params[:title].nil?
    render_failed(4,'Chưa chọn ẩn hiện') and return if params[:is_displayed].nil?
    render_failed(5,'Chưa chọn loại') and return if params[:type_id].nil?
    render_failed(6,'Chưa nhập ') and return if params[:content].nil?

    blog_params = params.permit(:title, :content, :is_displayed, :type_id)
    blog = params[:id].present? ? Blog.find_by_id(params[:id]) : Blog.new()
    blog.attributes = blog_params
    blog.save! unless blog.invalid?

    render_success({})
  end

end