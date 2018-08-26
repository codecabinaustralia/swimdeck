class Skill < ApplicationRecord
  belongs_to :level
  has_many :posts
end
