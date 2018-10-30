class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :create]
  def index
    posts = PostsModel.getAllPosts
    @my_posts = posts.where(user_id: current_user.id)
  end

  def new
    @post = PostsModel.createPost
  end

  def create
    post = Post.new(set_post_params)
    post.save

    redirect_to posts_path
  end

  def edit
  end

  def update
    #@post.update_attributes(set_post_params)
    PostsModel.setPost(@post.id, set_post_params)
    redirect_to posts_path
  end

  def show
    @post = PostsModel.getPost(params[:id])
  end

  def destroy
    PostsModel.destroyPost(@post.id)
    redirect_to posts_path
  end

  private
  def set_post_params
    params.require(:post).permit(:user_id, :title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
