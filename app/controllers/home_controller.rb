class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def sample
    render layout: false
  end

  def ajax_test

  end

  def remote_test

  end

  def page
    render file: "public/pages/#{params[:page]}.html"
  end
end
