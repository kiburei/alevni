# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def user_mailer_preview
    UserMailer.user_email(User.first)
  end

end
