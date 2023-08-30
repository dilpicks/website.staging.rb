# == Schema Information
#
# Table name: articles
#
#  article_type_id  :bigint           not null
#  classes          :string           default([]), is an Array
#  created_at       :datetime         not null
#  featured         :boolean          default(TRUE), not null
#  id               :bigint           not null, primary key
#  link             :text
#  location         :text
#  meta_description :text
#  meta_title       :string(255)
#  page_status_id   :bigint           not null
#  published_at     :datetime
#  slug             :string
#  source           :string(255)
#  subtitle         :string(255)
#  summary          :text
#  title            :string(255)      not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_articles_on_article_type_id  (article_type_id)
#  index_articles_on_page_status_id   (page_status_id)
#  index_articles_on_slug             (slug) UNIQUE
#  index_articles_on_title            (title) UNIQUE
#
require 'rails_helper'

RSpec.describe Article, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
