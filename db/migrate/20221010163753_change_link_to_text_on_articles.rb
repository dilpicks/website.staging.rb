class ChangeLinkToTextOnArticles < ActiveRecord::Migration[7.0]
  def change
    change_column :articles, :link, :text, null: true, default: nil
  end
end
