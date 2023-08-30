# == Schema Information
#
# Table name: people
#
#  bio         :text
#  created_at  :datetime         not null
#  featured    :boolean          default(FALSE), not null
#  id          :bigint           not null, primary key
#  link        :text
#  name        :string(255)      not null
#  slug        :string
#  summary     :text
#  team_member :boolean          default(FALSE), not null
#  title       :string(255)
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_people_on_slug  (slug) UNIQUE
#
require 'rails_helper'

RSpec.describe Person, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
