class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  has_many :product_variants
  has_many :variants, through: :product_variants
  has_many :order_items
  has_many :orders, through: :order_items
end
