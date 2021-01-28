class CreateUserCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :user_coupons do |t|
      t.references :user, foreign_key: true
      t.references :coupon, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
