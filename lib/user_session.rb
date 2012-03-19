class UserSession < Struct.new(:email, :password)
  def authenticate!
    User.authenticate(email, password) if valid?
  end

  private

  def valid?
    (email.present? && password.present?)
  end

end
