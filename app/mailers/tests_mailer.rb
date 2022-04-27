class TestsMailer < ApplicationMailer
  def completed_test(processed_test)
    @user = processed_test.user
    @test = processed_test.test

    mail to: @user.email, subject: 'You complete the TestGuru test '
  end
end
