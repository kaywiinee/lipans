class ApiController < ApplicationController
  include ApplicationHelper
  rescue_from Exception, :with => :render_500
  layout false

  def render_success(object = nil, message = nil, response_type = 'json')
    hash = { status: 1 }
    hash[:data] = object
    hash[:message] = message unless message.nil?
    if response_type == 'json'
      render json: JSON.pretty_generate(JSON.parse(hash.to_json))
    elsif response_type == 'html'
      render text: JSON.pretty_generate(JSON.parse(hash.to_json))
    end
  end

  def render_failed(reason_number, message, response_type = 'json')
    hash = { status: reason_number, message: message }
    if response_type == 'json'
      render json: JSON.pretty_generate(JSON.parse(hash.to_json))
    elsif response_type == 'html'
      render text: JSON.pretty_generate(JSON.parse(hash.to_json))
    end
  end

  def render_500(exception = nil)
    if exception
      logger.info "Rendering 500 with exception: #{exception.message}"
    end
    #message = exception.message

    unless Rails.env == 'production'
      message = "#{exception.message}\n#{exception.backtrace.join("\n")}"
    end

    if exception.kind_of? ActionController::InvalidAuthenticityToken
      message = "invalid authenticity token"

    end
    render_failed(0, message)

  end

  def render_failed_by_no_login(message = t('notifications.required_login'), response_type = 'json')
    render_failed(102, message, response_type = 'json')
  end

  def render_failed_by_missing_params(message = t('api.error_missing_params'), response_type = 'json')
    render_failed(100, message, response_type = 'json')
  end

  def render_failed_invalid_params(message = t('api.error_invalid_params'), response_type = 'json')
    render_failed(101, message, response_type = 'json')
  end

  def render_failed_by_required_operator(message = t('api.error_required_operator'), response_type = 'json')
    render_failed(103, message, response_type = 'json')
  end

end

#device methods
#before_filter :authenticate_user!
#user_signed_in?
#current_user
#user_session