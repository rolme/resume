class Section < ActiveRecord::Base
  belongs_to :parent, class_name: 'Section'
  has_many :items
  has_and_belongs_to_many :cvs
  attr_accessible :header,
                  :parent,
                  :type

  # Public: Get the child sections for this instance.
  #
  # Returns an ActiveRecord:Relation.
  def subsections
    Section.where(parent_id: id)
  end

  # Public: Get the child sections for this instance ordered by position.
  #
  # Returns an ActiveRecord:Relation.
  def subsections_ordered_by_position
    subsections_ordered_by(:position)
  end

private

  # Private: Get the child sections for this instance ordered by attribute.
  #
  # attribute - a Symbol for an Section attribute.
  #
  # Returns an ActiveRecord:Relation.
  def subsections_ordered_by(attribute)
    subsections.order(attribute)
  end
end
