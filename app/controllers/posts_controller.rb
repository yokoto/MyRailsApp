class PostsController < ApplicationController
  before_action :correct_user, only: :destroy

  def index
    @posts = Post.page(params[:page])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿されました。"
      redirect_to root_url
    else
      @feed_items = current_user.posts.where("user_id = ?", current_user.id).page(params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿が削除されました。"
    redirect_to request.referrer || root_url # 1つ前のURLか、なければrootを返す
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])  # 現在のユーザーが削除対象のマイクロポストを保有してるかどうか
      redirect_to root_url if @post.nil?
    end
end
