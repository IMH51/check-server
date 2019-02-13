class QuerySerializer < ActiveModel::Serializer
  attributes :id, :com_card1, :com_card2, :com_card3, :com_card4, :com_card5, :hand_card1, :hand_card2, :players, :created_at
  has_one :odd
end
