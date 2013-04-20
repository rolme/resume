class ContactInformation < ActiveRecord::Base
  belongs_to :user
  attr_accessible :contact_email,
                  :facebook,
                  :first_name,
                  :github,
                  :home_phone,
                  :instagram,
                  :last_name,
                  :linkedin,
                  :middle_initial,
                  :mobile_phone,
                  :twitter,
                  :url,
                  :user

  validates :user, presence: true
end
