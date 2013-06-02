class Skillset < Section
  has_many :skills, :foreign_key => :section_id

  # Public: Get skills ordered by position.
  #
  # Returns an ActiveRecord:Relation.
  def skills_order_by_position
    Skill.where(section_id: id).order(:position)
  end
end

