class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost = current_user.microposts.build if signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def blog

    @post_type = params[:post_type]  # default app type
    @post_type = 1 if @post_type == nil

    @blogs = Post.blogs_for_type(@post_type).paginate(page: params[:page])
    @recent_blogs = Post.recent_blogs(10)
    if signed_in?
      @post = current_user.posts.build if signed_in?
    end
  end

  # def blog_detail
  #   @current_blog = Post.find_by_id(params[:blog_id])
  # end
end
