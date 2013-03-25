class User < Person
  has_one :authentication, :as => :authenticationable
  delegate :handle, :email, :password, :password_confirmation, :active_for_authentication?, :to => :authentication
  attr_accessible :authentication

  def self.create_user(params)
    user = User.new(params[:authentication][:user])
    user.authentication = Authentication.new(params[:authentication].reject {|k,v| k == "user" })
    user
  end
end