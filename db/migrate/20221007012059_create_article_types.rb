class CreateArticleTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :article_types do |t|

      t.timestamps
    end

    add_column :article_types, :kind, :string, null: false, limit: 255

    add_column :article_types, :slug, :string
    add_index :article_types, :slug, unique: true

    add_index :article_types, [:kind], unique: true

    ArticleType.create!(kind: 'News')
    ArticleType.create!(kind: 'Publication')
    ArticleType.create!(kind: 'Press Release')
    ArticleType.create!(kind: 'Award')
  end
end
