require 'test_helper'

class GifsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gif = gifs(:one)
  end

  test "should get index" do
    get gifs_url
    assert_response :success
  end

  test "should not be able to get new if signed out" do
    get new_gif_url
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should be able to get new if signed in" do
    sign_in users(:one)
    get new_gif_url
    assert_response :success
  end

  test "should redirect if create gif but not signed in" do
    post gifs_url, params: { gif: {} }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create gif" do
    sign_in users(:one)

    assert_difference('Gif.count') do
      file = Rack::Test::UploadedFile.new("test/files/example.gif", "image/gif")
      post gifs_url, params: { gif: { image: file, tag_list: "test" } }
    end

    assert_redirected_to gif_url(Gif.last)
  end

  test "should show gif" do
    get gif_url(@gif)
    assert_response :success
  end

  test "should redirect if edit gif but not signed in" do
    get edit_gif_url(@gif)
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get edit" do
    sign_in users(:one)
    get edit_gif_url(@gif)
    assert_response :success
  end

  test "should redirect if update gif but not signed in" do
    patch gif_url(@gif), params: { gif: { tag_list: "new tag" } }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update gif" do
    sign_in users(:one)
    patch gif_url(@gif), params: { gif: { tag_list: "new tag" } }
    assert_redirected_to gif_url(@gif)
  end

  test "should redirect if destroy gif but not signed in" do
    delete gif_url(@gif)
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should destroy gif" do
    sign_in users(:one)

    assert_difference('Gif.count', -1) do
      delete gif_url(@gif)
    end

    assert_redirected_to gifs_url
  end

  test "renders catch all" do
    get random_gif_url(tag: "test")
    assert_response :success
  end
end
