class Dashboard::ApplicationController < ApplicationController
  layout 'dashboard'

  before_action :authenticate_user!
  before_action :role_authorize

  def role_authorize
    return if current_user.admin?

    redirect_to root_path, alert: 'You are not authorized to access this page'
  end
end
