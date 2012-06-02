require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  def setup
    @post = Post.create({
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph })
    @user = User.create!({ email: Faker::Internet.email, password: "12345" })
  end

  #
  # show
  #

  test "should get show" do
    get :show, { id: @post }

    assert_response :success
    assert_not_nil assigns(:post)
  end

  #
  # index
  #

  test "should get index" do
    get :index

    assert_response :success
    assert_not_nil assigns(:posts)
  end

  #
  # new
  #

  test "should get new" do
    use_ssl
    sign_in_as(@user)
    get :new

    assert_response :success
    assert assigns(:post).new_record?
  end

  #
  # create
  #

  test "should post improperly to create" do
    use_ssl
    sign_in_as(@user)
    post :create, { post: {} }

    assert_response 400
    assert assigns(:post).new_record?
  end

  test "should post to create" do
    use_ssl
    sign_in_as(@user)
    params = {
      post: {
        title: Faker::Company.bs,
        content: Faker::Lorem.paragraphs
      }
    }

    assert_difference("Post.count", +1) do
      post :create, params
    end

    assert_redirected_to post_path(assigns(:post))
  end

  #
  # destroy
  #

  test "should delete to destroy" do
    use_ssl
    sign_in_as(@user)

    assert_difference("Post.count", -1) do
      delete :destroy, { id: @post }
    end

    assert_redirected_to posts_path
  end

  #
  # edit
  #

  test "should get edit" do
    use_ssl
    sign_in_as(@user)
    get :edit, { id: @post }

    assert_response :success
  end

  #
  # update
  #

  test "should put to update improperly" do
    use_ssl
    sign_in_as(@user)
    put :update, { id: @post, post: { title: "" } }

    assert_response 400
  end

  test "should put to update" do
    use_ssl
    sign_in_as(@user)
    new_title = "new title"
    put :update, { id: @post, post: { title: new_title } }

    assert_redirected_to post_path(assigns(:post))
    assert_equal assigns(:post).title, new_title
  end

end
