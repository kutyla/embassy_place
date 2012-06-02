class PostsController < ApplicationController
  PER_PAGE = 10
  @user_actions = [:new, :create, :edit, :update, :destroy]

  before_filter :require_user, :require_ssl, only: @user_actions

  def index
    @posts = Post.order_by([:created_at, :desc]).page(params[:page]).per(PER_PAGE)
  end

  def show
    @post = Post.find_by_permalink(params[:id])
  end

  def new
    @post = Post.new
  end

  # POST /posts
  def create
    @post = Post.new

    if @post.update_attributes(params[:post])
      flash[:notice] = t("controllers.posts.create.success")
      redirect_to post_path(@post)
    else
      flash.now[:error] = t("controllers.posts.create.failure")
      render :new, status: 400
    end
  end

  # GET /posts/:permalink/edit
  def edit
    @post = Post.find_by_permalink(params[:id])
  end

  # PUT /posts/:permalink
  def update
    @post = Post.find_by_permalink(params[:id])

    if @post.update_attributes(params[:post])
      flash[:notice] = t("controllers.posts.update.success")
      redirect_to post_path(@post)
    else
      flash.now[:error] = t("controllers.posts.update.failure")
      render :edit, status: 400
    end
  end

  # DELETE /posts/:permalink
  def destroy
    @post = Post.find_by_permalink(params[:id])

    @post.destroy
    flash[:notice] = t("controllers.posts.destroy.success")
    redirect_to posts_path
  end

end
