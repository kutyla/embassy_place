class SessionsController < Clearance::SessionsController
  before_filter :require_ssl

  def new
    @user_struct = UserSession.new
  end

  def create
    email = params[:user_session][:email]
    password = params[:user_session][:password]
    @user_struct = UserSession.new(email, password)

    if @user = @user_struct.authenticate!
      sign_in(@user)
      flash[:success] = t(".controllers.sessions.create.success")
      redirect_to root_path
    else
      flash.now[:error] = t(".controllers.sessions.create.error")
      render :new, status: 401
    end
  end

end
