class PostsController < ApplicationController
  #before_action :set_post, except: [:index, :new, :create]

  def self.index(current_user)
    posts = PostModel.getAllPosts
    return posts.where(user_id: current_user.id)
  end

  def self.new_p
    return PostModel.createPost
  end

  def self.create(params)
    byebug
    post = Post.new
    post.user_id = params[:user_id]
    post.title = params[:title]
    post.body = params[:body]
    post.image = params[:image]
    post.posted_at = params[:posted_at]
    post.save

    return Post.last.id
  end

  def self.edit(post)
  end

  def self.update(post)
    #@post.update_attributes(set_post_params)
    PostModel.setPost(post.id, set_post_params)

  end

  def self.show(post)
    post = PostModel.getPost(post.id)
  end

  def self.destroy(post)
    PostModel.destroyPost(post.id)
  end

end
