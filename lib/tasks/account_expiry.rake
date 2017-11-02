namespace :account_expiry do
    desc "TODO"
  task send_email_after_365days: :environment do
  	accounts21 = User.where("end_subscription =?", Date.today + 21)
  	accounts14 = User.where("end_subscription =?", Date.today + 14)
  	accounts7 = User.where("end_subscription =?", Date.today + 7)
  	accounts0 = User.where("end_subscription =?", Date.today)
  	accounts = [accounts21, accounts14, accounts7, accounts0]
  	@usermail = "cow"
  	accounts.each do |account|
  		puts account.count
  	end
    # UserMailer.expire_accounts.deliver
  end
end
