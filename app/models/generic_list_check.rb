class GenericListCheck < ApplicationRecord
  belongs_to :generic_checklist
  belongs_to :user
end
