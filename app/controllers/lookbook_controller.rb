class LookbookController < ApplicationController
  def index
    @my_posts = Post.index(current_user)
  end
end
