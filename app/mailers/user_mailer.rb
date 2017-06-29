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

  def expire_account
    @expired_accounts = User.where("end_subscription <?", Date.today);
    @expired_accounts.each do |send_mail|
        if send_mail.email == "akiburei@gmail.com"
          @email = send_mail.email
          puts send_mail.email
          mail to: @email, subject: "Account Has Expired"
          puts "mail should be tumwad"
        end
      end
  end

end
