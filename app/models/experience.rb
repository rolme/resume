class Experience < ActiveRecord::Base
  belongs_to :experienceable, polymorphic: true
  attr_accessible :company, :title, :department, :end_date, :experienceable_id, :experienceable_type, :start_date
end
