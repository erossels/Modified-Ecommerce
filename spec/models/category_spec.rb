require 'rails_helper'

RSpec.describe Category, type: :model do
  context "Category" do
    before(:all) do
      @parent = Category.create(name: 'Test_Parent')
      @child = @parent.subcategories.build(name: 'Test_Child')
    end
    it "should equal subcategory" do
      expect(@parent.subcategories[0]).to eq(@child)
    end
    it "should reference to parent" do
      expect(@child.parent).to eq(@parent)
    end
    it "should have only one parent" do
      expect(@child.parent_id.integer?).to eq(true)
    end
  end
end
