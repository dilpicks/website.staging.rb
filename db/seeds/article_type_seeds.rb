# rails db:seed:article_type_seeds
# heroku run rails db:seed:article_type_seeds --app renegadebio-staging

# ===========================================================================
# Article Types
# ===========================================================================

article_types = [
  {
    slug: 'news',
    kind: 'News'
  },
  {
    slug: 'publication',
    kind: 'Publication'
  },
  {
    slug: 'press-release',
    kind: 'Press Release'
  },
  {
    slug: 'award',
    kind: 'Award'
  },
]

article_types.each do |article_type_attributes|
  existing_article_type = ArticleType.find_by(slug: article_type_attributes[:slug])
  existing_article_type.present? ? existing_article_type.update!(article_type_attributes) : ArticleType.create!(article_type_attributes)
end
