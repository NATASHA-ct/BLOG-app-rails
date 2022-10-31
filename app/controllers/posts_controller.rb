class UsersController < ApplicationController
  def index; end

# view a specific post  
  def show
    @post_id = params[:id]
  end
end
