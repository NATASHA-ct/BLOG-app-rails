class UsersControllers < ApplicationController
  def index; end

  def show
    params[:users_id]
  end
end
