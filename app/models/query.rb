class Query < ApplicationRecord
  belongs_to :user
  has_one :odd
end
