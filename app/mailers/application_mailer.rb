class ApplicationMailer < ActionMailer::Base
  default from: %{'TestGuru' <mail@etestguru.com>}
  layout 'mailer'
end
