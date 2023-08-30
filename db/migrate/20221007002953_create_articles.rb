class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|

      t.timestamps
    end

    add_column :articles, :title, :string, null: false, limit: 255
    add_column :articles, :content, :text, null: true, default: nil
    add_column :articles, :link, :string, null: true, default: nil, limit: 255
    add_column :articles, :source, :string, null: true, default: nil, limit: 255
    add_column :articles, :image, :string, null: true, default: nil, limit: 255
    add_column :articles, :classes, :string, array: true, default: []

    add_reference :articles, :page_status, null: false, foreign_key: true

    add_index :articles, [:title], unique: true

    add_column :articles, :slug, :string
    add_index :articles, :slug, unique: true
  end
end
