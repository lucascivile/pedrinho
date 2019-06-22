require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group = groups(:one)
  end

  test "should save" do 
    group = Group.new({ name: @group.name, place: @group.place, date_time: @group.date_time, cost: @group.cost, additional_detail: @group.additional_detail })
    assert group.save
  end

  test "should destroy" do
    group = Group.new({ name: @group.name, place: @group.place, date_time: @group.date_time, cost: @group.cost, additional_detail: @group.additional_detail })
    assert group.save

    old_id = group.id
    group.destroy

    assert_nil Group.find_by_id(old_id)
  end

  test "should set cost to zero if input is not a number" do
    group = Group.new({ name: @group.name, place: @group.place, date_time: @group.date_time, cost: "a", additional_detail: @group.additional_detail })

    assert_equal group.cost, 0.0
  end

  test "copy's name should equal original's name" do 
    group = Group.new({ name: @group.name, place: @group.place, date_time: @group.date_time, cost: @group.cost, additional_detail: @group.additional_detail })
    assert group.save

    group_copy = Group.find_by_id(group.id)

    assert_equal group.name, group_copy.name
  end

  test "should not save group without name" do
    group = Group.new({ place: @group.place, date_time: @group.date_time, cost: @group.cost, additional_detail: @group.additional_detail })
    assert !group.save
  end

  test "should not save group with short name" do
    group = Group.new({ name: "a", place: @group.place, date_time: @group.date_time, cost: @group.cost, additional_detail: @group.additional_detail })
    assert !group.save
  end

end
