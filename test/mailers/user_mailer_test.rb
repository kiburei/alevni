require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "buy_shares" do
    mail = UserMailer.buy_shares
    assert_equal "Buy shares", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
