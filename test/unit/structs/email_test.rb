require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  def setup
    #
  end

  # valid?
  test "should validate message" do
    email = Email.new
    assert !email.valid?
  end
end