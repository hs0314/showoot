class ClothDm
  # 전체 포스트 가져오기
  def self.getAllClothes
    return Cloth.all
  end

  def self.createCloth(params=nil)
    if params==nil
      return Cloth.new
    else
      byebug
      cloth = Cloth.new
      cloth.codi_id = params[:codi_id]
      cloth.main_category = params[:main_category]
      cloth.sub_category = params[:sub_category]
      cloth.color = params[:color]

      cloth.save
    end
  end

  def self.getCloth(id)
    return Cloth.find(id)
  end

  def self.setCloth(id, cloth_params)
    cloth = Cloth.find(id)
    cloth.update_attributes(cloth_params)
  end

  def self.destroyCloth(id)
    cloth = cloth.find(id)
    cloth.destroy
  end
end
