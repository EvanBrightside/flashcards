# Application Controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login, except: [:not_authenticated]

  private

  def not_authenticated
    flash[:warning] = 'Please login first.'
    redirect_to log_in_path
  end
end
