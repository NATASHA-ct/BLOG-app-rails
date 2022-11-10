class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id].to_i)
    @posts = @user.posts.includes([:author])

  end

  def new
    @id = current_admin.id
    @post = Post.new
    @id = current_admin.id
  end

  def create
    post = post = Post.new(title: post_params[:title], text: post_params[:text], author: current_admin)
    @author = post.author
    
    if post.save
      redirect_to new_user_post_path(@author.id), message: 'Post was successfully created'
    else
      flash[:error] = 'Error:  Post was not created!!'
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments.includes([:author])
  end

  private

  # strong parameters
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
