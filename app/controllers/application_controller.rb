class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_email, :setup_cart

  protected

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def signed_in?
    !!current_user
  end
  helper_method :current_user, :signed_in?

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.nil? ? user : user.id
  end

  private

  def require_login
    redirect_to new_session_path, alert: I18n.t('flash.login.requred') unless current_user
  end

  def require_email
    if current_user && current_user.email.present?
      redirect_to edit_user_path(current_user)
    end
  end

  def setup_cart
    session[:cart] ||= []
  end

end
