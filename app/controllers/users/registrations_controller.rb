# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  # TODO: Implement this method
  # GET /resource/edit
  # def edit
  #   super
  # end

  # TODO: Implement this method
  # PUT /resource
  # def update
  #   super
  # end

  # NOT USED
  # DELETE /resource
  # def destroy
  #   super
  # end

  # NOT USED
  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :first_name, :last_name])
  end

  # TODO: Implement this method
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end
end
