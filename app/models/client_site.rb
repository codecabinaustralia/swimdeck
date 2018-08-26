class ClientSite < ApplicationRecord
  belongs_to :client
  belongs_to :site
end
