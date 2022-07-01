require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "should not save comment without body" do
    comment = Comment.new
    assert_not comment.save, "Comment saved without body"
  end
end
