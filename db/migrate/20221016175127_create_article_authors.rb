class CreateArticleAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :article_authors do |t|

      t.timestamps
    end

    add_reference :article_authors, :article, null: true, default: nil
    add_reference :article_authors, :author, null: true, default: nil, foreign_key: { to_table: :people }

    add_index :article_authors, [:article_id, :author_id], unique: true
  end
end
