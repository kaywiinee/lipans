class Admin::BlogsController < ApplicationController
  def index
  	@user = current_user
  end
end