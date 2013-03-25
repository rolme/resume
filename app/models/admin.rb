class Admin < Person
  has_one :authentication, :as => :authenticationable
  delegate :handle, :email, :password, :password_confirmation, :to => :authentication
end