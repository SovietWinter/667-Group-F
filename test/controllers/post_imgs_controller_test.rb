require 'test_helper'

class PostImgsControllerTest < ActionController::TestCase
  setup do
    @post_img = post_imgs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_imgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_img" do
    assert_difference('PostImg.count') do
      post :create, post_img: { image: @post_img.image, post_id: @post_img.post_id }
    end

    assert_redirected_to post_img_path(assigns(:post_img))
  end

  test "should show post_img" do
    get :show, id: @post_img
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_img
    assert_response :success
  end

  test "should update post_img" do
    patch :update, id: @post_img, post_img: { image: @post_img.image, post_id: @post_img.post_id }
    assert_redirected_to post_img_path(assigns(:post_img))
  end

  test "should destroy post_img" do
    assert_difference('PostImg.count', -1) do
      delete :destroy, id: @post_img
    end

    assert_redirected_to post_imgs_path
  end
end
