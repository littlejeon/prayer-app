class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]

  # def index
  #   @user = User.find_by(email: params[:email])
  # end

  # def new
  #   # render the page that shows the log in form
  # end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "You have been logged in!"
    else
      @user = User.new
      flash.now[:error] = "Bad Username or Password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have been logged out!"
  end
end