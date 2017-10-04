# Initial controller for user sign up
class UsersController < ApplicationController
  skip_before_action :require_login, only: %i{index new create}

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      login(params[:user][:email], params[:user][:password])
      flash[:success] = 'Welcome!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      flash[:success] = 'Update successfully!'
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
