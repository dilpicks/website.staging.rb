# == Schema Information
#
# Table name: copy_blocks
#
#  active           :boolean          default(TRUE), not null
#  classes          :text             default([]), is an Array
#  content          :text
#  contentable_id   :bigint           not null
#  contentable_type :string           not null
#  created_at       :datetime         not null
#  id               :bigint           not null, primary key
#  slug             :string
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_copy_blocks_on_contentable  (contentable_type,contentable_id)
#  index_copy_blocks_on_slug         (slug) UNIQUE
#
require 'rails_helper'

RSpec.describe CopyBlock, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
