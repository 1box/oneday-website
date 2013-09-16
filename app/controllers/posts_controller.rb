class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :edit, :update, :destroy]
  before_filter :admin_user, only: [:create, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update, :destroy]

  def show
    @current_blog = Post.find(params[:blog_id])
    # update views_count
    @current_blog.update_views_count
  end

  def new
  end

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Post created!"
      redirect_to blog_path(post_type: @post.post_type)
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "Post updated!"
      redirect_to blogdetail_path(blog_id: @post)
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted!"
    redirect_back_or blog_path(post_type: 1)
  end

  private
    def correct_user
      @post = current_user.posts.find_by_id(params[:id])
      redirect_to root_path if @post.nil?
    end
end
