class Api::UsersController < ApplicationController

  # GET /users
  def index
    @users = User.all
  end


end