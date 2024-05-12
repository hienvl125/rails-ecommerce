class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :prepare_password_actions_configuration, only: [:change_password, :update_password]

  def profile
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(update_profile_params)
      redirect_to profile_path, notice: "Profile updated successfully."
    else
      render :profile, status: :unprocessable_entity
    end
  end

  def change_password; end

  def update_password
    if update_password_params[:current_password].blank?
      @errors << "Current password can't be blank"
      return render :change_password, status: :unprocessable_entity
    end

    if update_password_params[:new_password].blank?
      @errors << "New password can't be blank"
      return render :change_password, status: :unprocessable_entity
    end

    unless current_user.valid_password?(update_password_params[:current_password])
      @errors << "Current password is incorrect"
      return render :change_password, status: :unprocessable_entity
    end

    if update_password_params[:new_password] != update_password_params[:new_password_confirmation]
      @errors << "New password and new password confirmation do not match"
      return render :change_password, status: :unprocessable_entity
    end

    if current_user.update(password: update_password_params[:new_password])
      sign_in(current_user, bypass: true)
      redirect_to profile_path, notice: "Changed password successfully."
    else
      render :change_password, status: :unprocessable_entity
    end
  end

  def purchase_history
  end

  private

  def update_profile_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def update_password_params
    params.require(:user).permit(:current_password, :new_password, :new_password_confirmation)
  end

  def prepare_password_actions_configuration
    @minimum_password_length = User::password_length.first
    @errors = []
  end
end
