class Admin::UsersController < ApplicationController
  def login
    
  end

  def login_success
    redirect_to new_user_session_path if params[:user].nil? || params[:user][:email].nil? || params[:user][:password].nil?
    user = User.find_by(email: params[:user][:email])
    unless user && user.valid_password?(params[:user][:password])
      redirect_to new_user_session_path
    else
      if user.type_id == 2
        sign_in(user)
        redirect_to admin_root_path
      else
        redirect_to new_user_session_path
      end
    end
  end

  def logout
    sign_out current_user if current_user.present?
    redirect_to admin_root_path
  end
end