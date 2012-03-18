class SessionsController < Clearance::SessionsController
  class UserSession < Struct.new(:email, :password); end

  def new
    @user_struct = UserSession.new
  end

  def create
    @user_struct = UserSession.new(params[:user_session][:email], params[:user_session][:password]) rescue UserSession.new

    if @user = User.authenticate(@user_struct.email, @user_struct.password)
      sign_in(@user)
      flash[:success] = "Welcome back!"
      redirect_to root_path
    else
      flash.now[:error] = "Sorry, we could not authenticate you. Please try again."
      render :new, status: 401
    end
  end

end
