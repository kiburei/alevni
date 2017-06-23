namespace :account_expiry do
    desc "TODO"
  task send_email_after_365days: :environment do
    @expired_accounts = User.where("end_subscription <?", Date.today);
    @expired_accounts.each do |send_mail|
        send_mail
    end
   end
end
