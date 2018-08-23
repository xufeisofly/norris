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
    @post.record_reader_ip(request.remote_ip)
  end

  def index
    @posts = Post.paginate(page: params[:page])
  end

  def update
  end

  private

  def set_post
    @post = Post.find params[:id]
  end

  def post_params
    file = params[:post][:content]

    params[:post][:tags] = params[:post][:tags].select { |el| el.present? }
    params[:post][:tags_attributes] = params[:post][:tags].map do |t|
      { name: t }
    end if params[:post][:tags].any?

    params[:post][:content_type] = file.original_filename.split('.').last
    params[:post][:content] = file.read

    params.require(:post).permit(:title, :content, :content_type, tags_attributes: [:name])
  end
end
