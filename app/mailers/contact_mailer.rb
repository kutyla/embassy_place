class ContactMailer < ActionMailer::Base
  default to: ENV["MAILER_TO"]
  default from: ENV["MAILER_FROM"]

  def question_email(message)
    @message = message
    mail({ subject: "Email from Site" })
  end

end
