class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|

      t.timestamps
    end

    add_column :events, :title, :string, null: false, limit: 255
    add_column :events, :classes, :string, array: true, default: []
    add_column :events, :occurred_at, :datetime, null: true

    # Self-referential
    add_reference :events, :event, null: true, default: nil, foreign_key: true

    add_column :events, :slug, :string
    add_index :events, :slug, unique: true
  end
end
