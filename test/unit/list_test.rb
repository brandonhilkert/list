require 'test_helper'

class ListTest < ActiveSupport::TestCase
  should have_many(:items)
end
