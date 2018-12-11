class SearchController < ApplicationController

  def search_by(search_term)
    arr = Set.new([])
    string = "%#{search_term}%"
    post = Post.where('title LIKE ? OR body LIKE ?', string, string)

    codi = Codi.where('event LIKE ?', string)
    cloth = Cloth.where('main_category LIKE ? OR sub_category LIKE ? OR color LIKE ?', string, string, string)
    cloth.each do |cloth|
      tmp = CodiModel.returnPost(cloth.codi_id)
      arr.add(tmp)
    end
    codi.each do |codi|
      arr.add(codi.post_id)
    end
    post.each do |post|
      arr.add(post.id)
    end

    target = Post.where(id: arr)

    target
  end

  def result
    if params[:search]
      @search_term = params[:search]
    end
    @target_posts = search_by(@search_term)
    @target_posts = @target_posts.where(user_id: current_user.id)
    return @target_post
  end

end
