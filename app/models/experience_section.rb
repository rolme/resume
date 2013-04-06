class ExperienceSection < Section 
  has_one :experience, as: :experienceable
  attr_accessible :experience
  delegate :title, :department, :company, :start_date, :end_date, :to => :experience
end