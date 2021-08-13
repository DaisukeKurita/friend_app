class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy ]
  def new
    if params[:back]
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end
  end
  def index
    @feeds = Feed.all
  end
  def create
    @feed = current_user.feeds.new(feed_params)
    if @feed.save
      redirect_to feeds_path, notice: "投稿をしました！"
    else
      render :new
    end
  end
  def show
  end
  def edit
  end
  def update
    if @feed.update(feed_params)
      redirect_to feeds_path notice: "投稿を編集しました"
    else
      render :edit
    end
  end
  def destroy
    @feed.destroy
    redirect_to feeds_path, notice: "投稿を削除しました"
  end
  def confirm
    @feed = current_user.feeds.new(feed_params)
    render :new if @feed.invalid?
  end
  private
  def feed_params
    params.require(:feed).permit(:content, :image, :image_cache)
  end
  def set_feed
    @feed = Feed.find(params[:id])
  end
end
