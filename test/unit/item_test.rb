require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  should validate_presence_of(:description)
end
