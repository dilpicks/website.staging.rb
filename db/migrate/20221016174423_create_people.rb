class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|

      t.timestamps
    end

    add_column :people, :name, :string, null: false, limit: 255
    add_column :people, :bio, :text, null: true, default: nil
    add_column :people, :slug, :string
    add_index :people, :slug, unique: true
  end
end
