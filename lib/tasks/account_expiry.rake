namespace :account_expiry do
    desc "TODO"
  task send_email_after_365days: :environment do
    UserMailer.expire_accounts.deliver
  end
end
