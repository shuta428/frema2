class Address < ApplicationRecord
  belongs_to :user, optional: true
  
  validates  :zipcode, :prefecture, :city, :address ,presence: true
end
