require 'rails_helper'

RSpec.describe "coupons/index", type: :view do
  before(:each) do
    assign(:coupons, [
      Coupon.create!(
        user: nil,
        code: "Code",
        amount: 2,
        percent_type: false
      ),
      Coupon.create!(
        user: nil,
        code: "Code",
        amount: 2,
        percent_type: false
      )
    ])
  end

  it "renders a list of coupons" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Code".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
