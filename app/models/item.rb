class Item < ActiveRecord::Base
  attr_accessible :description

  validates :description, presence: true
  validates :list_id, presence: true

  belongs_to :list
end
