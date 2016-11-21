class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @user = User.find(current_user[:id])
      @micropost = @user.microposts.build if logged_in?
      @micropost_all = current_user.feed_items
      @feed_items = @user.feed_items.page(params[:page]).per(30).includes(:user).order(created_at: :desc)
    end
  end
end