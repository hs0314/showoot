class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    #tab1 -> diary
    if params[:picked_date].present?
      @picked_date = params[:picked_date]
    else
      @picked_date = Date.today.strftime('%Y-%m-%d')
    end
    my_posts = PostsController.index(current_user)
    @target_posts = my_posts.where(posted_at: @picked_date.to_date)
  end
end
