class Codi < ApplicationRecord
  belongs_to :post
  #belongs_to :recommand
  has_many :clothes
end
