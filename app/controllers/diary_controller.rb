class DiaryController < ApplicationController
  before_action :set_post, except: [:pick_date, :index_post, :new_post, :create_post]

  def index_post
    if params[:picked_date].present?
      @picked_date = params[:picked_date]
    else
      @picked_date = Date.today.strftime('%Y-%m-%d')
    end
    my_posts = PostsController.index(current_user)
    @target_posts = my_posts.where(posted_at: @picked_date)
  end

  def show_post
    PostsController.show(@post)
  end

  def new_post
    @post = PostsController.new_p
    @picked_date = params[:picked_date]
  end

  def create_post
    #날씨정보 받아오기
    weather = get_current_weather

    #post params
    post_params = params[:post]
    post_id = PostsController.create(post_params)

    #codi params
    codi_params = {}
    codi_params.merge!(post_id: post_id)
    codi_params.merge!(weather: weather)
    codi_params.merge!(event: params[:event])
    codi_params.merge!(preference: params[:preference])
    codi_id = CodisController.create(codi_params)

    #clothes params
    clothes_info = JSON.parse(params["clothes_info"])
    clothes_info.each do |cloth_info|
      cloth_params = {}
      byebug
      cloth_params.merge!(codi_id: codi_id)
      cloth_params.merge!(main_category: cloth_info["main"])
      cloth_params.merge!(sub_category: cloth_info["sub"])
      cloth_params.merge!(color: cloth_info["color"])

      ClothesController.create(cloth_params)
    end

    redirect_to '/#!/diary/index_post'
  end

  def edit_post
    PostsController.edit(@post)
    @picked_date = @post.posted_at
  end

  def update_post
    PostsController.update(@post, params[:post])
    redirect_to '/#!/diary/index_post'
  end

  def destroy_post
    PostsController.destroy(@post)
    redirect_to '/#!/diary/index_post'
  end

  def pick_date
    @picked_date = params[:picked_date]
    my_posts = PostsController.index(current_user)
    @target_posts = my_posts.where(posted_at: @picked_date)
    #redirect_to index_posts_path(picked_date: @picked_date)
    respond_to do |format|
      format.js{ }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def get_current_weather
    response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?id=524901&APPID=9470ef016a30a1dd8fe2e39a52be2097&q=seoul&units=metric", headers: {"APPID" => "9470ef016a30a1dd8fe2e39a52be2097"}).parsed_response
    if response["main"]
      return response["main"]
    else
      return false
    end
  end
end
