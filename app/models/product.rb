class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  belongs_to_active_hash :shippingday
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :fee

  with_options presence: true do
  validates :name
  validates :content
  validates :price
  validates :condition_id
  validates :fee_id
  validates :prefecture_id
  validates :shippingday_id
  validates :category_id
  end
end
