class LoanMailer < ApplicationMailer
  default from: "vasiliy.sikorskiy@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: "Sample email")
  end
end
