require 'rails_helper'
require 'shoulda-matchers'

RSpec.describe Order, type: :model do
  context 'when creating and order' do
    before(:all) do
      @user = User.create(email: "test@test.cl", password: true)
      @order = Order.create(user_id: @user.id)
    end
    it 'creates and order' do 
      expect(@order).to be_valid
    end
    it 'generates a random number' do
      expect(@order.number.nil?).to eq(false)
    end 
    it 'has an order number' do 
      expect(subject.attributes).to include("number")
    end
    it 'has unique number' do 
      is_expected.to validate_uniqueness_of(:number).ignoring_case_sensitivity
    end
  end

  context 'when adding product' do 
    before(:all) do
      @user = User.create(email: "test@test.cl", password: true)
      
    end
    it 'adds product as order item' do
      @order = Order.create(user_id: @user.id)
      @producto = Product.create(name: "Producto", stock: 1, price: 100)
      @order.add_product(@producto.id, quantity = 1)
      expect(@order.order_items.count).to eq(1)
    end
    it 'fails to add product if stock = 0' do
      @order = Order.create(user_id: @user.id)
      @producto = Product.create(name: "Producto", stock: 0, price: 100)
      @order.add_product(@producto.id, quantity = 1)
      expect(@order.order_items.count).to eq(0)
    end
    it 'calculates the total price correctly' do
      @order = Order.create(user_id: @user.id)
      @producto1 = Product.create(name: "Producto", stock: 1, price: 100)
      @producto2 = Product.create(name: "Producto", stock: 1, price: 100)
      @order.add_product(@producto1.id, quantity = 1)
      @order.add_product(@producto1.id, quantity = 1)
      expect(@order.total).to eq(200)
    end
  end
end
