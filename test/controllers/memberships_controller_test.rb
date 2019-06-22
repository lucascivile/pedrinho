require 'test_helper'

class MembershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @membership = memberships(:one)
    @group = groups(:one)
    @user = users(:one)
  end

  test "should save" do 
    membership = Membership.new({ is_admin: @membership.is_admin, paid: @membership.paid, user_id: @user.id, group_id: @group.id})
    assert membership.save
  end

  test "should destroy" do
    membership = Membership.new({ is_admin: @membership.is_admin, paid: @membership.paid, user_id: @user.id, group_id: @group.id})
    assert membership.save

    old_id = membership.id
    membership.destroy

    assert_nil Membership.find_by_id(old_id)
  end

  test "should not save membership without user_id" do
    membership = Membership.new({ is_admin: @membership.is_admin, paid: @membership.paid, user_id: @user.id})
    assert !membership.save
  end

  test "should not save membership without group_id" do
    membership = Membership.new({ is_admin: @membership.is_admin, paid: @membership.paid, group_id: @group.id})
    assert !membership.save
  end
end
