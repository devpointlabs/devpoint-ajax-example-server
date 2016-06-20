class RenameProductsQuantityOnHand < ActiveRecord::Migration
  def change
  	rename_column :products, :quanity_on_hand, :quantity_on_hand
  end
end
