class AddShownToCharacteristicGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :characteristic_groups, :shown, :boolean, null: false, default: true
  end
end
