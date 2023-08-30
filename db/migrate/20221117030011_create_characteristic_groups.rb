class CreateCharacteristicGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :characteristic_groups do |t|

      t.timestamps
    end

    add_column :characteristic_groups, :slug, :string
    add_index :characteristic_groups, :slug, unique: true

    add_column :characteristic_groups, :name, :string, null: false, limit: 255
    add_column :characteristic_groups, :title, :string, null: true, default: nil, limit: 255
  end
end
