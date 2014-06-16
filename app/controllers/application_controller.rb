class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  #before_filter :require_login

  def require_login
    if !signed_in?
      puts"kristy"
      redirect_to '/user/kp'
    end
  end

end
