require 'test_helper'

class UserSessionTest < ActiveSupport::TestCase
  def setup
    @password = (0...8).map{65.+(rand(25)).chr}.join
    @user = User.create({
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: @password })
  end

  # authenticate!
  test "should return false when email is missing" do
    user_session = UserSession.new(nil, @password)
    assert_equal nil, user_session.authenticate!
  end

  test "should return false when password is missing" do
    user_session = UserSession.new(@user.email, nil)
    assert_equal nil, user_session.authenticate!
  end

  test "should return nil when authentication fails" do
    user_session = UserSession.new(@user.email, 'not the password')
    assert_equal nil, user_session.authenticate!
  end

  test "should return user when authentication passes" do
    user_session = UserSession.new(@user.email, @password)
    assert_equal @user, user_session.authenticate!
  end
end