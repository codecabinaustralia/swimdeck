class GenericChecklistStatus < ApplicationRecord
  belongs_to :generic_check_list
  belongs_to :user
end
