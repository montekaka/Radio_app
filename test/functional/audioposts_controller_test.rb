require 'test_helper'

class AudiopostsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup do
    @audiopost = audioposts(:one)
    @audiopost.show_id = shows(:one).id #set the parent to shows(:one)
    @audiopost.save
  end

  test "should get index" do
    get(:index, {'show_id' => shows(:one).id})
    assert_response :success
    assert_not_nil assigns(:audioposts)
  end

  test "should get new" do
    @user = users(:one)
    sign_in :user, @user #sign in as a user for creating audiopost  
    get :new, {'show_id' => shows(:one).id}
    assert_response :success
  end

  test "should create audiopost" do
    @user = users(:one)
    sign_in :user, @user #sign in as a user for creating audiopost  
    assert_difference('Audiopost.count') do
      post :create, :audiopost => @audiopost.attributes, :show_id => shows(:one).id
    end
    assert_redirected_to show_audiopost_path(shows(:one).id, assigns(:audiopost))
  end

  test "should show audiopost" do
    get :show, :id => @audiopost.to_param, :show_id => shows(:one).id
    assert_response :success
  end

  test "should get edit" do
    @user = users(:one)
    sign_in :user, @user #sign in as a user for creating audiopost  
    get :edit, :id => @audiopost.to_param, :show_id => shows(:one).id
    assert_response :success
  end

  test "should update audiopost" do
    @user = users(:one)
    sign_in :user, @user #sign in as a user for creating audiopost  
    put :update, :id => @audiopost.to_param, :audiopost => @audiopost.attributes, :show_id => shows(:one).id
    assert_redirected_to show_audiopost_path(shows(:one).id, assigns(:audiopost))
  end

  test "should destroy audiopost" do
    @user = users(:one)
    sign_in :user, @user #sign in as a user for creating audiopost  
    assert_difference('Audiopost.count', -1) do
      delete :destroy, :id => @audiopost.to_param, :show_id => shows(:one).to_param
    end

    assert_redirected_to show_path(shows(:one).id)
  end
end
