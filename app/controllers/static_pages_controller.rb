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
    @blogs = Post.all_blogs.paginate(page: params[:page])
    if signed_in?
      @post = current_user.posts.build if signed_in?
    end
  end
end
