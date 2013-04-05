class User < ActiveRecord::Base
  has_one :contact_information
  has_one :address

  delegate :first_name, :last_name, :middle_initial, :home_phone, :mobile_phone, :linkedin,
           :contact_email, :url, :github, :twitter, :instagram, :facebook, :to => :contact_information

  delegate :street1, :street2, :city, :state, :zip, :to => :address

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :login, :email, :password, :password_confirmation, :remember_me, :handle, :type
  attr_accessor :login

  validates :handle, :uniqueness => true,
                     :length => { :minimum => 3 },
                     :format => { :with => /\A[a-zA-Z0-9_-]+\z/,
                                  :message => "Alphanumeric, underscore, and dash characters only" }

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(handle) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end