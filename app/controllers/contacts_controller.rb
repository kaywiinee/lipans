class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(set_params)
    unless @contact.valid?
      flash.now[:error] = 'Gửi thất bại, vui lòng thử lại.'
      render :index
      return
    end
    UserMailer.contact_mail_user(@contact).deliver
    flash.now[:notice] = 'Gửi thành công! Chúng tôi sẽ sớm trả lời thư của bạn.'
    render :index  
  end

  private
  def set_params
    params.require(:contact).permit(:name,:email,:phone,:subject,:message)
  end

end