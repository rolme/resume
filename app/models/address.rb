class Address < ActiveRecord::Base
  belongs_to :user
  attr_accessible :city, :county, :name, :state, :street1, :street2, :zip

  validates :user, :presence => true
end
