class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <adnikolaev22@gmail.com>}
  layout 'mailer'
end
