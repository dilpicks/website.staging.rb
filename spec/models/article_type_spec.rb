# == Schema Information
#
# Table name: article_types
#
#  created_at :datetime         not null
#  id         :bigint           not null, primary key
#  kind       :string(255)      not null
#  slug       :string
#  updated_at :datetime         not null
#
# Indexes
#
#  index_article_types_on_kind  (kind) UNIQUE
#  index_article_types_on_slug  (slug) UNIQUE
#
require 'rails_helper'

RSpec.describe ArticleType, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
