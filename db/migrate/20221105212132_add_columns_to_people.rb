class AddColumnsToPeople < ActiveRecord::Migration[7.0]
  ActiveRecord::Base.connection.execute("TRUNCATE TABLE articles, copy_blocks, images, people, article_authors RESTART IDENTITY")

  def change
    add_column :people, :team_member, :boolean, null: false, default: false
    add_column :people, :featured, :boolean, null: false, default: false
    add_column :people, :title, :string, null: true, default: nil, limit: 255
    add_column :people, :summary, :text, null: true, default: nil
    add_column :people, :link, :text, null: true, default: nil
  end
end
