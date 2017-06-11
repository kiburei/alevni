namespace :expire_sale do
  desc "TODO"
  task expire_sale_requests: :environment do
  	@expired = ShareSellRequest.where("validity_days <?", Date.today)
   	@expired.each do |expire|
   		puts "update seller shares back"
   		@not_sold = expire.shares.where(share_buy_request_id: nil)
   		puts @not_sold
   		@not_sold.update(status: true, share_sell_request_id: nil)
   		expire.update(no_of_shares: @not_sold.count)
   	end
  end

end
