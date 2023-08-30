class MigrateArticleContentToCopyBlocks < ActiveRecord::Migration[7.0]
  def change
    articles_with_content = Article.where.not(content: nil)

    if articles_with_content.present?
      articles_with_content.each do |article|
        article.copy_blocks << CopyBlock.new(content: article.content)
        article.save!
      end
    end

    remove_column :articles, :content
  end
end
