class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post Created"
      redirect_to posts_path
    else
      render :new
    end
  end

  private def post_params
    params.require(:post).permit(:name, :description, :user_id, :attached_file)
  end
end
