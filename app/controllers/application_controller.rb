class ApplicationController < ActionController::Base
  layout :determine_layout

  private

  def determine_layout
    if !user_signed_in? && unauth_layout_action?
      "unauth"
    else
      "application"
    end
  end

  def unauth_layout_action?
    return true if params[:controller] == "devise/sessions" && %w[new create].include?(params[:action])

    return true if params[:controller] == "users/registrations" && %w[new create].include?(params[:action])

    return true if params[:controller] == "devise/passwords" && %w[new create edit update].include?(params[:action])

    return false 
  end
end
