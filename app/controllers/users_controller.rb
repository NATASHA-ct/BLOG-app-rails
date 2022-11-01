class UsersController < ApplicationController
  def index; end

  def show
   @users_id = params[:users_id]
  end
end
