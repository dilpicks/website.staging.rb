class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|

      t.timestamps
    end

    add_column :tests, :slug, :string
    add_index :tests, :slug, unique: true

    add_column :tests, :name, :string, null: false, limit: 255
    add_column :tests, :title, :string, null: true, default: nil, limit: 255

    add_column :tests, :code, :string, null: false, limit: 255
    add_column :tests, :cpt_codes, :text, array: true, default: []

    add_column :tests, :shown, :boolean, null: false, default: true
    add_column :tests, :available, :boolean, null: false, default: true

    add_column :tests, :published_at, :datetime, null: true
  end
end
