# == Schema Information
#
# Table name: images
#
#  alt            :string(255)
#  classes        :text             default([]), is an Array
#  created_at     :datetime         not null
#  height         :integer
#  id             :bigint           not null, primary key
#  imageable_id   :bigint
#  imageable_type :string
#  primary        :boolean          default(FALSE), not null
#  slug           :string
#  src            :text             not null
#  title          :string(255)
#  updated_at     :datetime         not null
#  width          :integer
#
# Indexes
#
#  index_images_on_imageable                                    (imageable_type,imageable_id)
#  index_images_on_primary_and_imageable_id_and_imageable_type  (primary,imageable_id,imageable_type) UNIQUE WHERE ("primary" = true)
#  index_images_on_slug                                         (slug) UNIQUE
#
require 'rails_helper'

RSpec.describe Image, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
