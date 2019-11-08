class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_cart


  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    if !logged_in?
      redirect_to login_path
    end
  end

  def require_admin_user
    if !current_user.admin? 
      redirect_to root_path
    end
  end

  def require_consumer_user
    if current_user.admin? 
      redirect_to root_path
    end
  end

  def logged_in?
    !!current_user
  end
 
  def get_cart
    begin
      @cart = ShoppingCart.find(session[:cart_id]) if logged_in?
    rescue ActiveRecord::RecordNotFound
      @cart = ShoppingCart.find_or_create_by(user: current_user)
      session[:cart_id] = @cart.id
    end
  end

  helper_method :current_user, :logged_in?
end
