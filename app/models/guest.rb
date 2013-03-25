class Guest < Person
  def handle
    "guest"
  end

  def guest?
  	self.class.name == "Guest"
  end
end