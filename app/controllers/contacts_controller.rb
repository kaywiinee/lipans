class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(set_params)
    unless @contact.valid?
      flash.now[:error] = 'Vui lòng điền vào các mục có dấu (*) và trả lời đúng câu hỏi bảo mật.'
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
  end

  private
  def set_params
    params.require(:contact).permit(:name,:email,:phone,:subject,:message,:humanizer_answer,:humanizer_question_id)
  end

end