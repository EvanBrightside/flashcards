# Controller for user log in and out sessions
class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
  end

  def create
    if login(params[:email], params[:password], params[:remember_me])
      flash[:success] = t('sessions.login.correct')
      redirect_back_or_to root_path
    else
      flash.now[:warning] = t('sessions.login.incorrect')
      render 'new'
    end
  end

  def destroy
    logout
    flash[:success] = 'See you!'
    redirect_to log_in_path
  end
end
