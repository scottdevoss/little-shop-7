class Discount < ApplicationRecord
  belongs_to :merchant 
  
  validates :discount, numericality: { only_integer: true }
  validates :qty, numericality: { only_integer: true }
end