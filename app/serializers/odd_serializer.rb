class OddSerializer < ActiveModel::Serializer
  attributes :id, :win, :lose, :tie
  belongs_to :query
end
