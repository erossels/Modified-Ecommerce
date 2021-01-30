class Order < ApplicationRecord
  before_create -> { generate_number(hash_size) }

  has_one :user, through: :user_coupons
  has_one :coupon, through: :user_coupons
  has_one :user_coupons

  has_many :order_items
  has_many :products, through: :order_items
  has_many :payments

  validates :number, uniqueness: true

  def generate_number(size)
    self.number ||= loop do
      random = random_candidate(size)
      break random unless self.class.exists?(number: random)
    end
  end

  def random_candidate(size)
    "#{hash_prefix}#{Array.new(size){rand(size)}.join}"
  end

  def hash_prefix
    "BO"
  end

  def hash_size
    9
  end

  def add_product(product_id, quantity)
    if has_stock(search_product(product_id))
      creates_order_item(search_product(product_id), quantity)
      compute_total
    end
  end

  def search_product(product_id)
    product = Product.find(product_id)
    product
  end

  def has_stock(product)
    true unless !(product && (product.stock > 0))
  end

  def creates_order_item(product, quantity)
    order_items.create(product_id: product.id, quantity: quantity, price: product.price)
  end

  def compute_total
    update_attribute(:total, calculate_total(order_items))
  end

  def calculate_total(order_items)
    sum = 0
    order_items.each do |item|
      sum += item.price
    end
    sum
  end
end
