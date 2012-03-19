class HomeController < ApplicationController
  def index
    #
  end

  def gallery
    #
  end

  def features
    #
  end

  def contact
    @email = Email.new
  end

  def create_contact
    @email = Email.new(params[:email][:message])

    if @email.valid?
      ContactMailer.question_email(@email.message).deliver
      flash[:success] = "Thanks for your message! We'll get back to you as soon as possible."
      redirect_to root_path
    else
      flash.now[:error] = "Some error."
      render :contact, status: 400
    end
  end
end
