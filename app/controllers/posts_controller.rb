# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show update]

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
    builder = Post.all.order(updated_at: :desc)

    if params[:tag_name].present?
      tag = Tag.find_by(name: params[:tag_name])
      builder = tag.posts
    end

    @posts = builder.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update; end

  private

  def set_post
    @post = Post.find params[:id]
  end

  def post_params
    file = params[:post][:content]

    params[:post][:tags] = params[:post][:tags].select(&:present?)
    if params[:post][:tags].any?
      params[:post][:tags_attributes] = params[:post][:tags].map do |t|
        { name: t }
      end
    end

    params[:post][:content_type] = file.original_filename.split('.').last
    params[:post][:content] = file.read

    params.require(:post).permit(:title, :content, :content_type, tags_attributes: [:name])
  end
end
