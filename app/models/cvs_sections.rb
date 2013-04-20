class CvsSections < ActiveRecord::Base
  belongs_to :cv
  belongs_to :section
end
