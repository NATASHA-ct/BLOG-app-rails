class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.includes(posts: [:comments]).find(params[:user_id].to_i)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end
end
