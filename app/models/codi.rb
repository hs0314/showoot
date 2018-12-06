class Codi < ApplicationRecord
  belongs_to :post
  #belongs_to :recommand
  has_many :cloths, dependent: :destroy

  def self.index(current_user)
    codis = CodiDm.getAllCodi
    return codis.where(user_id: current_user.id)
  end

  def self.new_codi
    return CodiDm.createCodi
  end

  def self.create_codi(params)
    CodiDm.createCodi(params)
    return Codi.last.id
  end

  def self.edit_codi(codi)
  end

  def self.update_codi(codi)
    CodiDm.setCodi(codi.id, set_codi_params)

  end

  def self.show_codi(codi)
    codi = CodiDm.getCodi(codi.id)
  end

  def self.destroy_codi(codi)
    CodiDm.destroyCodi(codi.id)
  end
end
