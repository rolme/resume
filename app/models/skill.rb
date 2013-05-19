class Skill < Item
  belongs_to :Skillset, :foreign_key => :section_id
end
