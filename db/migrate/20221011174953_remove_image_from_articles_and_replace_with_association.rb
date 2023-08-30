class RemoveImageFromArticlesAndReplaceWithAssociation < ActiveRecord::Migration[7.0]
  def change
    articles_with_images = Article.where.not(image: nil)

    if articles_with_images.present?
      articles_with_images.each do |article|
        article.images << Image.new(src: article.image)
        article.save!
      end
    end

    remove_column :articles, :image
  end
end
