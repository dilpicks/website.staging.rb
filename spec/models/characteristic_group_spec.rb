# == Schema Information
#
# Table name: characteristic_groups
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  name       :string(255)      not null
#  title      :string(255)
#  order      :integer          default(0), not null
#  shown      :boolean          default(TRUE), not null
#
# Indexes
#
#  index_characteristic_groups_on_slug  (slug) UNIQUE
#
require 'rails_helper'

RSpec.describe CharacteristicGroup, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
