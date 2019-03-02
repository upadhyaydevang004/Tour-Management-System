class WaitListConfirmationMailer < ApplicationMailer
  def notify_user(user)
    @user = user
    mail(to: @user.email, subject: "Congratulations")
  end
end
