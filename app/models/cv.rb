class Cv < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :sections

  attr_accessible :target, :title, :user

  validates :user, presence: true

  validates :title, presence: true,
                    uniqueness: true,
                    length: { minimum: 3 }

  validates :target, presence: true,
                     length: { minimum: 3 }
end
