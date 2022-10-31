class UsersControllers < ApplicationController
  def index; end

  # view a specific user  
  def show
    params[:users_id]
  end
end
