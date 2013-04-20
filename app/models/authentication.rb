class Authentication < ActiveRecord::Base
  belongs_to :authenticationable, polymorphic: true

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :handle,
                  :email,
                  :password,
                  :password_confirmation,
                  :remember_me
end
