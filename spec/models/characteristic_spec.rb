# == Schema Information
#
# Table name: characteristics
#
#  id                      :bigint           not null, primary key
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  slug                    :string
#  name                    :string(255)      not null
#  title                   :string(255)
#  shown                   :boolean          default(TRUE), not null
#  characteristic_group_id :bigint           not null
#  test_id                 :bigint           not null
#  order                   :integer          default(0), not null
#
# Indexes
#
#  index_characteristics_on_characteristic_group_id  (characteristic_group_id)
#  index_characteristics_on_slug                     (slug) UNIQUE
#  index_characteristics_on_test_id                  (test_id)
#
require 'rails_helper'

RSpec.describe Characteristic, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
