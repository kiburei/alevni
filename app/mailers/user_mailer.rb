class UserMailer < ApplicationMailer
      default from: 'invelakenya@gmail.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.buy_shares.subject
  #
  def buy_shares(share_buy_request)
    @share_buy_request = share_buy_request
    @user = User.find(@share_buy_request.user_id)
    @admin = "member@invela.co.ke"
    mail to: @admin, subject: "New Buy Request"
  end

  def transfer_shares(share_buy_request)
    @share_buy_request = share_buy_request
    @user = User.find(@share_buy_request.user_id)
    # @admin = "member@invela.co.ke"
    mail to: @user.email, subject: "Transfer of Shares Successful"
  end

  def expire_account(user)
    @user = user
    mail to: @user.email, subject: "Account Has Expired"
  end

end
