class AddOrderToCharacteristicAndCharacteristicGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :characteristics, :order, :integer, default: 0, null: false
    add_column :characteristic_groups, :order, :integer, default: 0, null: false
  end
end
