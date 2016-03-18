class UserMailer < ActionMailer::Base
  helper :application

  def contact_mail_user(data_hash)
    @data_hash = data_hash
    mail(subject:data_hash[:flag].present? ?  t('views.pages.contact.subject_user1') : t('views.pages.contact.subject_user')  , to: env_mail(data_hash[:email]))
  end
end