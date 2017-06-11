namespace :buy_requests do
  desc "TODO"
  task delete_after_38_hours: :environment do
    @not_paid = ShareBuyRequest.where(transaction_id: nil)
    @buy_requests = @not_paid.where("created_at <?", 48.hours.ago)
    @buy_requests.each do |buy_request|
    	buy_request.shares.update(status: false, share_buy_request_id: nil)
    	buy_request.destroy
    end

   end

 end

