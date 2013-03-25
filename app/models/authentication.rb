class Authentication < ActiveRecord::Base
  belongs_to :authenticationable, :polymorphic => true
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :handle, :email, :password, :password_confirmation, :remember_me

=begin
  # Will enable this later.
  validates :handle, :uniqueness => true,
                     :presence => true,
                     :length => { :minimum => 3 },
                     :format => { :with => /\A[a-zA-Z0-9_-]+\z/,
                                  :message => "Alphanumeric, underscore, and dash characters only" }
=end
end
