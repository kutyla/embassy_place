class Email < Struct.new(:message)
  def valid?
    message.present?
  end
end
