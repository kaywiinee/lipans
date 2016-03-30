class UserMailer < ActionMailer::Base
  
  def contact_mail_user(data)
    @data = data
    mail(subject: 'Có người gửi thắc mắc trên web', to: 'kimphuong43@gmail.com')
  end
end