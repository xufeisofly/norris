class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    redirect_to @post
  end

  def show
  end

  def index
    @posts = Post.all
  end

  def update
  end

  private

  def set_post
    @post = Post.find params[:id]
  end

  def post_params
    file = params[:post][:content]
    params[:post][:content] = file.read
    params.require(:post).permit(:title, :content)
  end
end
