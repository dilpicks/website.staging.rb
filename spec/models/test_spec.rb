# == Schema Information
#
# Table name: tests
#
#  available    :boolean          default(TRUE), not null
#  code         :string(255)      not null
#  cpt_codes    :text             default([]), is an Array
#  created_at   :datetime         not null
#  id           :bigint           not null, primary key
#  name         :string(255)      not null
#  published_at :datetime
#  shown        :boolean          default(TRUE), not null
#  slug         :string
#  title        :string(255)
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_tests_on_slug  (slug) UNIQUE
#
require 'rails_helper'

RSpec.describe Test, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
