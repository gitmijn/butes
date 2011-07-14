require 'test_helper'

class StepsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Step.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Step.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Step.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to step_url(assigns(:step))
  end

  def test_edit
    get :edit, :id => Step.first
    assert_template 'edit'
  end

  def test_update_invalid
    Step.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Step.first
    assert_template 'edit'
  end

  def test_update_valid
    Step.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Step.first
    assert_redirected_to step_url(assigns(:step))
  end

  def test_destroy
    step = Step.first
    delete :destroy, :id => step
    assert_redirected_to steps_url
    assert !Step.exists?(step.id)
  end
end
