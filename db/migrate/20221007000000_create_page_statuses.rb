class CreatePageStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :page_statuses do |t|

      t.timestamps
    end

    add_column :page_statuses, :status, :string, null: false, limit: 255

    add_column :page_statuses, :slug, :string
    add_index :page_statuses, :slug, unique: true

    add_index :page_statuses, [:status], unique: true

    PageStatus.create!(status: 'Published')
    PageStatus.create!(status: 'Unpublished')
  end
end
