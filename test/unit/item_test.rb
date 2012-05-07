require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  should validate_presence_of(:description)
  should validate_presence_of(:list_id)
  should belong_to(:list)
  should have_db_index(:list_id)
end
