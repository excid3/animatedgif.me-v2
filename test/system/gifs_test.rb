require "application_system_test_case"

class GifsTest < ApplicationSystemTestCase
  setup do
    @gif = gifs(:one)
  end

  test "visiting the index" do
    visit gifs_url
    assert_selector "h1", text: "Gifs"
  end

  test "creating a Gif" do
    visit gifs_url
    click_on "New Gif"

    fill_in "Image data", with: @gif.image_data
    fill_in "User", with: @gif.user_id
    click_on "Create Gif"

    assert_text "Gif was successfully created"
    click_on "Back"
  end

  test "updating a Gif" do
    visit gifs_url
    click_on "Edit", match: :first

    fill_in "Image data", with: @gif.image_data
    fill_in "User", with: @gif.user_id
    click_on "Update Gif"

    assert_text "Gif was successfully updated"
    click_on "Back"
  end

  test "destroying a Gif" do
    visit gifs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gif was successfully destroyed"
  end
end
