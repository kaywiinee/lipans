class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(set_params)
    unless @contact.valid?
      flash.now[:error] = 'Gửi thất bại, vui lòng thử lại.'
      return
    end
    # if @contact.deliver
    #   flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    # else
    #   flash.now[:error] = 'Cannot send message.'
    #   render :new
    # end

    #UserMailer.contact_mail_user(@contact)
    flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    redirect_to root_path
  end

  private
  def set_params
    params.require(:contact).permit(:name,:email,:phone,:subject,:message)
  end

end