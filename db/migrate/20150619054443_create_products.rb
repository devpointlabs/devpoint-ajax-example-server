class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.float :base_price
      t.text :description
      t.integer :quanity_on_hand, default: 0
      t.string :color
      t.string :weight
      t.text :other_attributes
    end
  end
end
