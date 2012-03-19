require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @valid_post_params = lambda {{
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph }}

    @post = Post.create(@valid_post_params.call)
  end

  test "should find by permalink" do
    assert_equal @post._id, Post.find_by_permalink(@post.permalink)._id
  end

  test "should set permalink on create" do
    post = Post.new(@valid_post_params.call)
    assert_equal nil, post.permalink
    post.save
    assert_not_nil post.permalink
  end

  test "should set permalink when title is changed" do
    original_permalink = @post.permalink
    @post.title = Faker::Lorem.sentence
    @post.save
    assert @post.permalink != original_permalink
  end

  test "should not change permalink if title isn't changed" do
    original_permalink = @post.permalink
    @post.content = Faker::Lorem.paragraph
    @post.save
    assert_equal original_permalink, @post.permalink
  end

end
