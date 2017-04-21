# Load the Rails application.
require File.expand_path('../application', __FILE__)

#config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
ActionMailer::Base.smtp_settings = {
:user_name => 'member@invela.co.ke',
:password => ' memberinvela16$$',
:domain => 'invela.co.ke',
:address => 'host23.safaricombusiness.co.ke',
:port => 465,
:authentication => :plain,
:enable_starttls_auto => true
}
# Initialize the Rails application.
Rails.application.initialize!
