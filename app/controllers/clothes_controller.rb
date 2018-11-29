class ClothesController < ApplicationController

  def self.index(current_user)
    clothes = ClothModel.getAllClothes
    return clothes.where(user_id: current_user.id)
  end

  def self.new_p
    return ClothModel.createCloth
  end

  def self.create(params)
    ClothModel.createCloth(params)
  end

  def self.edit(cloth)
  end

  def self.update(cloth)
    ClothModel.setCloth(cloth.id, set_cloth_params)

  end

  def self.show(cloth)
    cloth = ClothModel.getCloth(cloth.id)
  end

  def self.destroy(cloth)
    ClothModel.destroyCloth(cloth.id)
  end

end
