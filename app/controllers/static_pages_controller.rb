class StaticPagesController < ApplicationController
  def home
    @post = current_user.posts.build if user_signed_in?
    @feed_items = current_user.posts.where("user_id = ?", current_user.id).page(params[:page])
  end
end
