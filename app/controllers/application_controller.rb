class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private

  def basic_auth # BASIC認証設定
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters # メソッド名は慣例 userのストロングパラメーター
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])

    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  end
end
