class Experience < ActiveRecord::Base
  attr_accessible :company, :department, :end_date, :experienceable_id, :experienceable_type, :start_date, :title
end
