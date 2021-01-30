class UserCoupon < ApplicationRecord
  belongs_to :user
  belongs_to :coupon, optional: true
  belongs_to :order, optional: true
end
