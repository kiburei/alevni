class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    # Do something later
    @user = user_id
    UserMailer.purchase(@user).deliver_later
  end
end
