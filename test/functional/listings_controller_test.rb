require File.dirname(__FILE__) + '/../test_helper'

class ListingsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:listings)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_listing
    assert_difference('Listing.count') do
      post :create, :listing => { }
    end

    assert_redirected_to listing_path(assigns(:listing))
  end

  def test_should_show_listing
    get :show, :id => listings(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => listings(:one).id
    assert_response :success
  end

  def test_should_update_listing
    put :update, :id => listings(:one).id, :listing => { }
    assert_redirected_to listing_path(assigns(:listing))
  end

  def test_should_destroy_listing
    assert_difference('Listing.count', -1) do
      delete :destroy, :id => listings(:one).id
    end

    assert_redirected_to listings_path
  end
end
