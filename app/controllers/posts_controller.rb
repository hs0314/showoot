class PostsController < ApplicationController
  #before_action :set_post, except: [:index, :new, :create]

  def self.index(current_user)
    posts = PostsModel.getAllPosts
    return posts.where(user_id: current_user.id)
  end

  def self.new_p
    return PostsModel.createPost
  end

  def self.create(params)
    post = Post.new(set_post_params(params))
    post.save
  end

  def self.edit(post)
  end

  def self.update(post)
    #@post.update_attributes(set_post_params)
    PostsModel.setPost(post.id, set_post_params)

  end

  def self.show(post)
    post = PostsModel.getPost(post.id)
  end

  def self.destroy(post)
    PostsModel.destroyPost(post.id)
  end

  private
  def self.set_post_params(params)
    params.require(:post).permit(:user_id, :title, :body)
  end
end
