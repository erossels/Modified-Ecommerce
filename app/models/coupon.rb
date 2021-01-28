class Coupon < ApplicationRecord
  belongs_to :user, optional: true
  has_many :user_coupons, optional: true
  has_many :orders, through: :user_coupons
end
