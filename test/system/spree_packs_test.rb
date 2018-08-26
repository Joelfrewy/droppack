require "application_system_test_case"

class SpreePacksTest < ApplicationSystemTestCase
  setup do
    @spree_pack = spree_packs(:one)
  end

  test "visiting the index" do
    visit spree_packs_url
    assert_selector "h1", text: "Spree Packs"
  end

  test "creating a Spree pack" do
    visit spree_packs_url
    click_on "New Spree Pack"

    click_on "Create Spree pack"

    assert_text "Spree pack was successfully created"
    click_on "Back"
  end

  test "updating a Spree pack" do
    visit spree_packs_url
    click_on "Edit", match: :first

    click_on "Update Spree pack"

    assert_text "Spree pack was successfully updated"
    click_on "Back"
  end

  test "destroying a Spree pack" do
    visit spree_packs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Spree pack was successfully destroyed"
  end
end
