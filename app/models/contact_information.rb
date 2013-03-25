class ContactInformation < ActiveRecord::Base
  belongs_to :contact_type
  attr_accessible :information, :contact_type

  validates :contact_type, :presence => true
end
