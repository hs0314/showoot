class Cloth < ApplicationRecord
  belongs_to :codi

  def self.index(current_user)
    clothes = ClothDm.getAllClothes
    return clothes.where(user_id: current_user.id)
  end

  def self.new_cloth
    return ClothDm.createCloth
  end

  def self.create_cloth(params)
    ClothDm.createCloth(params)
  end

  def self.edit_cloth(cloth)
  end

  def self.update_cloth(cloth)
    ClothDm.setCloth(cloth.id, set_cloth_params)

  end

  def self.show_cloth(cloth)
    cloth = ClothDm.getCloth(cloth.id)
  end

  def self.destroy_cloth(cloth)
    ClothDm.destroyCloth(cloth.id)
  end
end
