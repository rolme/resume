class ContactType < ActiveRecord::Base
  has_many :contact_informations
  attr_accessible :name
end
