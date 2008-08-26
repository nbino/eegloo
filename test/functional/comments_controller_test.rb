require File.dirname(__FILE__) + '/../test_helper'

class CommentsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:comments)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_comments
    assert_difference('Comments.count') do
      post :create, :comments => { }
    end

    assert_redirected_to comments_path(assigns(:comments))
  end

  def test_should_show_comments
    get :show, :id => comments(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => comments(:one).id
    assert_response :success
  end

  def test_should_update_comments
    put :update, :id => comments(:one).id, :comments => { }
    assert_redirected_to comments_path(assigns(:comments))
  end

  def test_should_destroy_comments
    assert_difference('Comments.count', -1) do
      delete :destroy, :id => comments(:one).id
    end

    assert_redirected_to comments_path
  end
end
