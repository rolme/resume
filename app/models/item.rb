class Item < ActiveRecord::Base
  belongs_to :section
  attr_accessible :description, :section, :type

  validates :description, :presence => true
end
