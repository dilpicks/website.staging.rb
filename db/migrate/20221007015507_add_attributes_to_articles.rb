class AddAttributesToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :published_at, :datetime, null: true
    add_column :articles, :featured, :boolean, null: false, default: true
    add_column :articles, :summary, :string, null: true, default: nil, limit: 255
    add_column :articles, :subtitle, :string, null: true, default: nil, limit: 255
    add_column :articles, :meta_title, :string, null: true, default: nil, limit: 255
    add_column :articles, :meta_description, :text, null: true, default: nil
    add_column :articles, :location, :text, null: true, default: nil
  end
end
