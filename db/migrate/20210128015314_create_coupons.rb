class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.references :user, foreign_key: true, optional: true
      t.string :code
      t.integer :amount
      t.boolean :percent_type

      t.timestamps
    end
  end
end
