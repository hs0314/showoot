class CodisController < ApplicationController
  #before_action :set_post, except: [:index, :new, :create]

  def self.index(current_user)
    codis = CodiModel.getAllPosts
    return codis.where(user_id: current_user.id)
  end

  def self.new_p
    return CodiModel.createPost
  end

  def self.create(params)
    post = Codi.new
    CodiModel.createCodi(params)
  end

  def self.edit(codi)
  end

  def self.update(codi)
    #@post.update_attributes(set_post_params)
    CodiModel.setCodi(codi.id, set_codi_params)

  end

  def self.show(post)
    post = CodiModel.getCodi(codi.id)
  end

  def self.destroy(post)
    CodiModel.destroyCodi(codi.id)
  end

end
