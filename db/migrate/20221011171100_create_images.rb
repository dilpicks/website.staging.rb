class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|

      t.timestamps
    end

    add_column :images, :src, :text, null: false
    add_column :images, :title, :string, null: true, default: nil, limit: 255
    add_column :images, :alt, :string, null: true, default: nil, limit: 255
    add_column :images, :width, :integer, default: nil, null: true
    add_column :images, :height, :integer, default: nil, null: true
    add_column :images, :classes, :text, array: true, default: []

    add_reference :images, :imageable, polymorphic: true, null: false

    add_column :images, :slug, :string
    add_index :images, :slug, unique: true
  end
end
