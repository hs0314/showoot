class DiaryController < ApplicationController
  before_action :set_params, except: [:index_post, :new_post, :create_post]
  def index_post
    @my_posts = PostsController.index(current_user)
  end

  def show_post
    PostsController.show(@post)
  end

  def new_post
    @post = PostsController.new_p
  end

  def create_post
    PostsController.create(params)
    redirect_to '/diary/index_post'
  end

  def edit_post
    PostsController.edit(@post)
  end

  def update_post
    PostsController.update(@post)
    redirect_to '/diary/index_post'
  end

  def destroy_post
    PostsController.destroy(@post)
    redirect_to '/diary/index_post'
  end

  private
  def set_params
    @post = Post.find(params[:id])
  end
end
