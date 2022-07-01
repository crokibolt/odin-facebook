require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user1 = User.create(email: "miriom@bar.com", password: "1234")
    @user2 = User.create(email: "trom@bar.com", password: "1234")    
  end

  test "should not save without email or password" do
    no_email = User.new(password: '123')
    no_password = User.new(email: 'foo@bar.com')

    assert_not no_email.save, "Saved without email"  
    assert_not no_password.save, "Saved without password"
  end

  test "should add friend" do
    @user1.friends << @user2

    assert_not (@user2.friends.empty? && @user1.friends.empty?), "Friend not added"
  end

  test "should add post to user" do
    deivi = users(:david)
    deivi.posts.build(body: "sample text")

    assert deivi.posts, "User posts is empty"
  end

  test "should add message to user" do
    user = users(:david)
    user.comments.build(body: "Sample comment")

    assert_not user.comments.empty?, "User.messages is empty "
  end
end
