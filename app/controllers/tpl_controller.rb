class TplController < ApplicationController
  rescue_from Exception, :with => :render_500
  layout false
  def index
    render file: "#{params[:path]}"
  end

  def render_500(exception = nil)
    if exception
      render text: "template not found : #{params[:path]}"
    end
  end
end
