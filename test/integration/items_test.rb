require "test_helper"

class ItemsTest < ActionDispatch::IntegrationTest

  def setup
    @list = List.create
    visit list_items_url(@list)
  end

  test "An item can be added and removed to the list" do
    within "#new_item" do
      fill_in "item[description]", with: "Eggs"
      click_button "Add"
    end

    assert has_content? "Eggs"
    assert_equal 1, Item.count

    within "ul.items" do
      click_on "Delete"
    end

    assert has_no_content? "Eggs"
    assert_equal 0, Item.count
  end

  test "Can clear the whole list" do
    within "#new_item" do
      fill_in "item[description]", with: "Eggs"
      click_button "Add"
    end

    within "#new_item" do
      fill_in "item[description]", with: "Milk"
      click_button "Add"
    end

    click_link "Clear All"

    assert has_no_content? "Eggs"
    assert has_no_content? "Milk"
    assert_equal 0, Item.count
  end
end