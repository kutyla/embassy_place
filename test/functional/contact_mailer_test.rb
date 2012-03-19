require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  def test_contact_email
    message = "Some message"
    email = ContactMailer.question_email(message).deliver
    assert !ActionMailer::Base.deliveries.empty?

    assert_equal [ContactMailer.default_params[:to]], email.to
    assert_equal "Email from Site", email.subject
    assert_match(/#{message}/, email.encoded)
  end
end
