class CreateCharacteristics < ActiveRecord::Migration[7.0]
  def change
    create_table :characteristics do |t|

      t.timestamps
    end

    add_column :characteristics, :slug, :string
    add_index :characteristics, :slug, unique: true

    add_column :characteristics, :name, :string, null: false, limit: 255
    add_column :characteristics, :title, :string, null: true, default: nil, limit: 255

    add_column :characteristics, :shown, :boolean, null: false, default: true

    add_reference :characteristics, :characteristic_group, null: false, foreign_key: true
    add_reference :characteristics, :test, null: false, foreign_key: true
  end
end
