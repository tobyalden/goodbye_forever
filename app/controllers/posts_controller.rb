class PostsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def download
    @post = Post.find(params[:id])
    @post.update(copies_remaining: @post.copies_remaining - 1)
    if @post.copies_remaining == 0
      @post.update(time_sold_out: DateTime.now)
    end
    redirect_to @post.attached_file.url
  end

  def purge
    Post.all.each do |post|
      if !post.on_display?
        post.destroy
      end
    end
    @posts = Post.all
    redirect_to posts_path
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

  def destroy
    post = Post.find(params[:id])
    post.destroy
    @posts = Post.all
    redirect_to posts_path
  end


  private def post_params
    params.require(:post).permit(:name, :description, :user_id, :attached_file, :copies_remaining)
  end
end
