require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save post without body" do
    post = Post.new
    assert_not post.save, "Saved article without body"
  end
end 
