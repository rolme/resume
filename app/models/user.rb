class User < ActiveRecord::Base
  has_one :contact_information
  has_one :address

  delegate :contact_email,
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
           to: :contact_information

  delegate :city,
           :state,
           :street1,
           :street2,
           :zip,
           to: :address

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         authentication_keys: [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,
                  :handle,
                  :login,
                  :password,
                  :password_confirmation,
                  :remember_me,
                  :type

  attr_accessor :login

  validates :handle, uniqueness: true,
                     length: { minimum: 3 },
                     format: {
                       with:    /\A[a-zA-Z0-9_-]+\z/,
                       message: 'Alphanumeric, underscore, & dashes only'
                     }

  def self.find_first_by_auth_conditions(warden_conditions)
    handle_or_email_eq = 'lower(handle) = :l OR lower(email) = :l'

    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where([handle_or_email_eq, {l: login.downcase}]).first
    else
      where(conditions).first
    end
  end

  # Public: Get the full name.
  #
  # Returns a String.
  def full_name
    [first_name, middle_initial, last_name].join(' ')
  end
end
