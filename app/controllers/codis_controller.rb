class CodisController < ApplicationController

  def self.index(current_user)
    codis = CodiModel.getAllCodi
    return codis.where(user_id: current_user.id)
  end

  def self.new_p
    return CodiModel.createCodi
  end

  def self.create(params)
    CodiModel.createCodi(params)
    return Codi.last.id
  end

  def self.edit(codi)
  end

  def self.update(codi)
    CodiModel.setCodi(codi.id, set_codi_params)

  end

  def self.show(codi)
    codi = CodiModel.getCodi(codi.id)
  end

  def self.destroy(codi)
    CodiModel.destroyCodi(codi.id)
  end

end
