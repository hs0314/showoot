class CodiModel
  # 전체 포스트 가져오기
  def self.getAllCodis
    return Codi.all
  end

  def self.createCodi
    return Codi.new
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
