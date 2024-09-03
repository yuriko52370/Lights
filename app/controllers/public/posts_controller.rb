class Public::PostsController < ApplicationController

  def new
    @post = Post.new
    @choice = Choice.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
    @choice = Choice.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, choices_attributes: [:id, :post_id, :choice, :_destroy])
  end
end
