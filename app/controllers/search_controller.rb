class SearchController < ApplicationController
  #before_action :set_post, except: [:index, :new, :create]

  def index
    if params[:search]
      @search_term = params[:search]
      @posts = Postscontroller.search_by(@search_term)
    end
  end

  def all
    posts = PostModel.getAllPosts
    return posts.where(user_id: current_user.id)
  end

  def search
    posts = PostModel.getAllPosts
    return posts.where(user_id: current_user.id)
  end

  def result
    if params[:search]
      @search_term = params[:search]
    end
    @target_posts = PostModel.search_by(@search_term)
    #byebug
    @target_posts = @target_posts.where(user_id: current_user.id)
    byebug
    return @target_post
  end
  
end
