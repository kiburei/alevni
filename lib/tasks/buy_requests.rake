namespace :buy_requests do
  desc "TODO"
  task delete_after_38_hours: :environment do
    # ShareBuyRequest.where(['created_at < ?', 2.minutes.ago]).destroy
    @shares = Share.where('created_at < ?', 1.minute.ago)
    @shares.update(status: false, share_buy_request_id: nil)
  end

end
