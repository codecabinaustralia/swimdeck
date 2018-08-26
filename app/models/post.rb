class Post < ApplicationRecord
  belongs_to :student
  belongs_to :user
  belongs_to :skill, required: false
  has_many :comments
  has_many_attached :files
  
end
