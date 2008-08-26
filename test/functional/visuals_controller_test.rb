require File.dirname(__FILE__) + '/../test_helper'

class VisualsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:visuals)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_visual
    assert_difference('Visual.count') do
      post :create, :visual => { }
    end

    assert_redirected_to visual_path(assigns(:visual))
  end

  def test_should_show_visual
    get :show, :id => visuals(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => visuals(:one).id
    assert_response :success
  end

  def test_should_update_visual
    put :update, :id => visuals(:one).id, :visual => { }
    assert_redirected_to visual_path(assigns(:visual))
  end

  def test_should_destroy_visual
    assert_difference('Visual.count', -1) do
      delete :destroy, :id => visuals(:one).id
    end

    assert_redirected_to visuals_path
  end
end
