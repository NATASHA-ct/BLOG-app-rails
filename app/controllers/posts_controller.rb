class PostsController < ApplicationController
  def index; end

  def show
    @post_id = params[:id]
  end
end
