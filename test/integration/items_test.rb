require "test_helper"

class ItemsTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.current_driver = Capybara.javascript_driver
    visit root_path
    click_link "Create New List"
  end

  test "An item can be added and removed to the list" do
    within "#new-item" do
      fill_in "item", with: "Eggs"
      click_button "Add"
    end

    assert has_content? "Eggs"
    debugger
    # assert_equal 1, Item.count

    within "ul.items" do
      click_on "Delete"
    end

    assert has_no_content? "Eggs"
    # assert_equal 0, Item.count
  end

  test "Can clear the whole list" do
    within "#new-item" do
      fill_in "item", with: "Eggs"
      click_button "Add"
      fill_in "item", with: "Milk"
      click_button "Add"
    end

    click_button "Clear All"

    assert has_no_content? "Eggs"
    assert has_no_content? "Milk"
    assert_equal 0, Item.count
  end
end