class Skillset < Section
  has_many :skills, :foreign_key => :section_id
end

