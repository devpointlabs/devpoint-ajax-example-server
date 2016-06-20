class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :base_price, :description, :quanity_on_hand,
             :color, :weight, :other_attributes
end
