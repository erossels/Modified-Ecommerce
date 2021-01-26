require "application_system_test_case"

class VariantsTest < ApplicationSystemTestCase
  setup do
    @variant = variants(:one)
  end

  test "visiting the index" do
    visit variants_url
    assert_selector "h1", text: "Variants"
  end

  test "creating a Variant" do
    visit variants_url
    click_on "New Variant"

    fill_in "Color", with: @variant.color
    fill_in "Size", with: @variant.size
    fill_in "Stock", with: @variant.stock
    click_on "Create Variant"

    assert_text "Variant was successfully created"
    click_on "Back"
  end

  test "updating a Variant" do
    visit variants_url
    click_on "Edit", match: :first

    fill_in "Color", with: @variant.color
    fill_in "Size", with: @variant.size
    fill_in "Stock", with: @variant.stock
    click_on "Update Variant"

    assert_text "Variant was successfully updated"
    click_on "Back"
  end

  test "destroying a Variant" do
    visit variants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Variant was successfully destroyed"
  end
end
