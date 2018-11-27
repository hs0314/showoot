class CodiModel
  # 전체 포스트 가져오기
  def self.getAllCodis
    return Codi.all
  end

  def self.createCodi(params=nil)
    if params==nil
      return Codi.new
    else
      post = Codi.new
      post.post_id = params[:post_id]
      post.weather = params[:weather] if params[:weather] != false
      post.event = params[:event]
      post.preference = params[:preference]
      post.save
    end
  end

  def self.getCodi(id)
    return Codi.find(id)
  end

  def self.setCodi(id, codi_params)
    codi = Codi.find(id)
    codi.update_attributes(codi_params)
  end

  def self.destroyCodi(id)
    codi = Codi.find(id)
    codi.destroy
  end
end
