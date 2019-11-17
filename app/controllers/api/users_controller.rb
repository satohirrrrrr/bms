class Api::UsersController < ApplicationController
  protect_from_forgery :except => %i[delete create]
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

  # POST /users/
  def create
    @user = User.new(update_for_user_params)
    @user_profile = UserProfile.new(update_for_user_profile_params.merge({user_id: @user.id})) if @user.save
    respond_to do |format|
      if @user_profile.save!
        render :json => {} and return
      else
        format.json { render json: @user, status: :unprocessable_entity } and return
      end
    end
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