class ApplicationController < ActionController::Base
  include Banken
  protect_from_forgery with: :exception
  before_action :require_login

  private

  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end

  def require_login
    unless current_user
      redirect_to login_url
    end
  end
end
