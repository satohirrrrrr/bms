class Api::UsersController < ApplicationController
  protect_from_forgery :except => [:delete]
  before_action :set_user, only: %i[delete show update]

  # GET /users
  def index
    @users = User.includes(:user_profile).active_all
  end

  # POST /users/:id
  def delete
    @user.user_profile.delete
    @user.user_profile.save!
    @user
  end

  # GET /users/:id
  def show
  end

  # PATCH /users/:id
  def update
    @user.update(update_for_user_params)
    @user.user_profile.update(update_for_user_profile_params)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def update_for_user_params
    params.require(:user).permit(:email)
  end

  def update_for_user_profile_params
    params.require(:user_profile).permit(:last_name,
      :first_name)
  end

end