class PostsController < ApplicationController

  enable_sync only: [:index, :create, :download]
  before_filter :authenticate_user!, except: [:index, :show, :download]

  def index
    @posts = Post.all.sort_by {|post| post.created_at}
    @posts = @posts.reverse
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def download
    @post = Post.find(params[:id])
    if @post.copies_remaining <= 1
      @post.update(copies_remaining: 0, time_sold_out: DateTime.now)
    else
      @post.update(copies_remaining: @post.copies_remaining - 1)
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
    redirect_to root_path
  end

  def create
    @posts = Post.all
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :index
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    @posts = Post.all
    redirect_to root_path
  end


  private
  def post_params
    params.require(:post).permit(:user_id, :attached_file, :copies_remaining)
  end
end
