require 'rails_helper'

RSpec.describe CartsController, :type => :controller do

  describe 'GET #show' do
    before do
      @controller = CartsController.new
      @user = User.create(email: "test@test.cl", password: true)
      @current_user = @user
      sign_in @user
      @product = Product.create(name: "Producto", stock: 1, price: 100)
      @order = Order.create(user_id: @user.id)
      @order.add_product(@product.id, quantity = 1)
      get :show, params: { id: @order.id }
    end
    it { expect(response.status).to eq(200) }
    it { expect(response.headers["Content-Type"]).to eql("text/html; charset=utf-8")}
    it { is_expected.to render_template :show }
  end

  # describe "PUT update/id:" do
  #   let(:product) do 
  #     {name}
  #   end

  # describe "PUT update/:id" do
  #   let(:cart) do 
  #     { :title => 'new title', :content => 'new content' }
  #   end
  #   let(:product_id) do 
  #     { :title => 'new title', :content => 'new content' }
  #   end
  
  #   before(:each) do
  #     @producto = Product.create(name: "Producto", stock: 0, price: 100)
  #     product = params[:cart][:product_id]
  #     quantity = params[:cart][:quantity]

  #   current_order.add_product(product, quantity)
  #     put :update, :id => @cart.id, :article => attr
  #     @cart.reload
  #   end
  
  #   it { response.should redirect_to(root_path) }
  #   it { @article.title.should eql attr[:title] }
  #   it { @article.content.should eql attr[:content] }
  # end

end
