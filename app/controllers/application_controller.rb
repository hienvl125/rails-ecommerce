class ApplicationController < ActionController::Base
  layout :determine_layout

  private 

  def determine_layout
    if !user_signed_in? && sign_in_or_sign_up_or_forgot_password_action?
      "unauth"
    else
      "application"
    end
  end

  def sign_in_or_sign_up_or_forgot_password_action?
    return true if params[:controller] == "devise/sessions" && params[:action] == "new"

    return true if params[:controller] == "users/registrations" && params[:action] == "new"

    return true if params[:controller] == "devise/passwords" && params[:action] == "new"

    return false 
  end
end
