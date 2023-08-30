class AddArticleTypeReferenceToArticles < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :article_type, null: false, foreign_key: true
  end
end
