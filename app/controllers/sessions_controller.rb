class SessionsController < Clearance::SessionsController
  def new
    @user_struct = UserSession.new
  end

  def create
    email = params[:user_session][:email]
    password = params[:user_session][:password]
    @user_struct = UserSession.new(email, password)

    if @user = @user_struct.authenticate!
      sign_in(@user)
      flash[:success] = "Welcome back!"
      redirect_to root_path
    else
      flash.now[:error] = "Sorry, we could not authenticate you. Please try again."
      render :new, status: 401
    end
  end

end
