class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users_id = params[:users_id]
  end
end
