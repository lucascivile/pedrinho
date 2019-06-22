require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should save" do
    user = User.new({ username: "user", password_digest: BCrypt::Password.create('secret') })
    assert user.save
  end

  test "should destroy" do
    user = User.new({ username: "user", password_digest: BCrypt::Password.create('secret') })
    assert user.save

    old_id = User.find_by_id(user.id)
    user.destroy

    assert_nil User.find_by_id(old_id)
  end

  test "should not save user duplicate by username" do
    user1 = User.new({ username: "user", password_digest: BCrypt::Password.create('secret') })
    user1.save
    user2 = User.new({ username: "user", password_digest: BCrypt::Password.create('secret') })
    assert !user2.save
  end

end
