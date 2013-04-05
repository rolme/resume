class Section < ActiveRecord::Base
  belongs_to :parent, :class_name => 'Section'
  has_many :items
  has_and_belongs_to_many :cvs
  attr_accessible :header, :type, :parent

  validates :header, :presence => true,
                     :length => { :minimum => 3 }

  def subsections
    Section.where('parent_id = ?', self.id)
  end
end
