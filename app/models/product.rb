class Product < ActiveRecord::Base
  serialize :other_attributes
  validates :name, presence: true
end
