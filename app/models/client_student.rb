class ClientStudent < ApplicationRecord
  belongs_to :client
  belongs_to :student
end
