require 'rails_helper'

RSpec.describe "coupons/new", type: :view do
  before(:each) do
    assign(:coupon, Coupon.new(
      user: nil,
      code: "MyString",
      amount: 1,
      percent_type: false
    ))
  end

  it "renders new coupon form" do
    render

    assert_select "form[action=?][method=?]", coupons_path, "post" do

      assert_select "input[name=?]", "coupon[user_id]"

      assert_select "input[name=?]", "coupon[code]"

      assert_select "input[name=?]", "coupon[amount]"

      assert_select "input[name=?]", "coupon[percent_type]"
    end
  end
end
