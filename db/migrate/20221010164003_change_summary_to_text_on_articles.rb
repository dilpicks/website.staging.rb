class ChangeSummaryToTextOnArticles < ActiveRecord::Migration[7.0]
  def change
    change_column :articles, :summary, :text, null: true, default: nil
  end
end
