class UserMailer < ActionMailer::Base
  
  def contact_mail_user(data_hash)
    @data_hash = data_hash
    mail(subject: 'Có người gửi thắc mắc trên web', to: 'kimphuong43@gmail.com')
  end
end