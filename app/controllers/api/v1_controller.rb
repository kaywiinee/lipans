class Api::V1Controller < ApiController

  # get list services
  # params {page}
  def api1
    limit = params[:limit].to_i.abs > 0 ? params[:limit].to_i.abs : 10
    page = params[:page].to_i.abs > 0 ? params[:page].to_i.abs : 1
    
    services = Service.page(page).per(limit).as_json
    total = (Service.all.length.to_f/limit).ceil
    render_success ({services: services, total: total})
  end
end