class SponsoredPostsController < ApplicationController

  def show
    @sponsor = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsor = SponsoredPost.new
  end

  def edit
    @sponsor = SponsoredPost.find(params[:id])
  end
end
