class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(set_params)
    if simple_captcha_valid?
      unless @contact.valid?
        flash.now[:error] = 'Gửi thất bại! Vui lòng thử lại.'
        render :index
        return
      end
      data = {
        name: @contact.name,
        email: @contact.email,
        phone: @contact.phone,
        subject: @contact.subject,
        message: @contact.message
      }
      UserMailer.delay.contact_mail_user(data)
      flash.now[:notice] = 'Gửi thành công! Chúng tôi sẽ sớm trả lời thư của bạn.'
      render :index
    else
      flash.now[:error] = 'Captcha không đúng!'
      render :index
      return
    end
  end

  private
  def set_params
    params.require(:contact).permit(:name,:email,:phone,:subject,:message)
  end

end