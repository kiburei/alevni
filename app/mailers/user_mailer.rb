class UserMailer < ApplicationMailer
  default from: 'gooddeeds17@gmail.com'
  layout 'mailer'

  def user_email(user)
    @user = User.find(1)
    puts @user
    mail(to: @user.email, subject: 'Sample Email', body: 'You have requested to purchase x number of shars from property 700X located in X. Payments for the said shares are to be made withing 48hours of receiving this request else the reserved shares will be cancelled.')
  end


end
