class LookbookController < ApplicationController
  def index
    @my_posts = Post.index(current_user)
    @others_posts = Post.where.not(user_id: current_user.id)
  end
end
