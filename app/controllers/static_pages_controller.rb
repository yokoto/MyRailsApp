class StaticPagesController < ApplicationController
  def home
    @post = current_user.posts.build if user_signed_in?
    @posts = Post.all.page(params[:page])
  end
end
