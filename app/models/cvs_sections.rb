class CvsSections < ActiveRecord::Base
  belongs_to :Cv
  belongs_to :section
end