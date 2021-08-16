require 'test_helper'

class DeviseMailerTest < ActionMailer::TestCase
  test 'valid SMTP settings' do
    settings = ActionMailer::Base.smtp_settings
    smtp = Net::SMTP.new(settings[:address], settings[:port])
    smtp.enable_starttls_auto if settings[:enable_starttls_auto]
    smtp.start(settings[:domain]) do |smtp|
      smtp.authenticate(settings[:user_name], settings[:password], settings[:authentication])
    end
  end
end
