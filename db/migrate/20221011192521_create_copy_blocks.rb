class CreateCopyBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :copy_blocks do |t|

      t.timestamps
    end

    add_reference :copy_blocks, :contentable, polymorphic: true, null: false

    add_column :copy_blocks, :active, :boolean, null: false, default: true
    add_column :copy_blocks, :content, :text, null: true, default: nil

    add_column :copy_blocks, :classes, :text, array: true, default: []

    add_column :copy_blocks, :slug, :string
    add_index :copy_blocks, :slug, unique: true
  end
end
