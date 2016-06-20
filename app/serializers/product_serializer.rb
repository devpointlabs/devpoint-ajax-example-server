class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :base_price, :description, :quantity_on_hand,
             :color, :weight, :other_attributes
end
