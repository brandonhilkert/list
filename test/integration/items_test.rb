require "test_helper"

class ItemsTest < ActionDispatch::IntegrationTest
  test "An item can be added to the list" do
    visit items_path
    within "#new_item" do
      fill_in "item[description]", :with => "Eggs"
      click_button "Add"
    end

    assert has_content? "Eggs"
    assert_equal 1, Item.count
  end

  test "An item can be deleted from the list" do
    Item.create(description: "Eggs")

    visit items_path
    within "ul.items" do
      click_on "Delete"
    end

    assert has_no_content? "Eggs"
    assert_equal 0, Item.count
  end

  test "Can clear the whole list" do
    Item.create(description: "Eggs")
    Item.create(description: "Milk")

    visit items_path
    click_link "Clear All"

    assert has_no_content? "Eggs"
    assert has_no_content? "Milk"
    assert_equal 0, Item.count
  end
end