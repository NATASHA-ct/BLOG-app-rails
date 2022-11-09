class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id].to_i)
    @posts = @user.posts.includes([:author])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @author = current_user
    @post.author = @author
    if @post.save
      flash[:success] = 'Post was successfully created'
      redirect_to new_user_post_path(@author.id), notice: ''
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
