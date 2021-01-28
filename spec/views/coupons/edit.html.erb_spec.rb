require 'rails_helper'

RSpec.describe "coupons/edit", type: :view do
  before(:each) do
    @coupon = assign(:coupon, Coupon.create!(
      user: nil,
      code: "MyString",
      amount: 1,
      percent_type: false
    ))
  end

  it "renders the edit coupon form" do
    render

    assert_select "form[action=?][method=?]", coupon_path(@coupon), "post" do

      assert_select "input[name=?]", "coupon[user_id]"

      assert_select "input[name=?]", "coupon[code]"

      assert_select "input[name=?]", "coupon[amount]"

      assert_select "input[name=?]", "coupon[percent_type]"
    end
  end
end
