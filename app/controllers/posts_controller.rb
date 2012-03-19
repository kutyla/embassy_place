class PostsController < ApplicationController
  PER_PAGE = 10

  def index
    @posts = Post.order_by([:created_at, :desc]).page(params[:page]).per(PER_PAGE)
  end

  def show
    @post = Post.find_by_permalink(params[:id])
  end


end
