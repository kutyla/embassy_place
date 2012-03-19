require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  def setup
    @post = Post.create({
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph })
  end

  test "should get show" do
    get :show, { id: @post.permalink }

    assert_response :success
    assert_not_nil assigns(:post)
  end

  test "should get index" do
    get :index

    assert_response :success
    assert_not_nil assigns(:posts)
  end

end
