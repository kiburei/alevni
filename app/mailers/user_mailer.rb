class UserMailer < ApplicationMailer
  default from: 'member@invela.co.ke'
  layout 'mailer'

  def user_email(user)
    @user = user
    mail(to: @user.email, subject: 'Thanks for signing up for our amazing app')
  end

  def purchase(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: 'Interest to buy shares')
  end

  def sell(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: 'Interest to sell shares')

  end

end
