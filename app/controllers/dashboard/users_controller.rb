# Initial controller for user sign up
class Dashboard::UsersController < ApplicationController
  skip_before_action :require_login, only: %i[index new create]

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      flash[:success] = t('flash.update')
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :locale, :password, :password_confirmation)
  end
end
