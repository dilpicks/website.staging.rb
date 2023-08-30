# frozen_string_literal: true

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
class CharacteristicGroupSerializer
  include Rails.application.routes.url_helpers
  include JSONAPI::Serializer

  # Config
  # ==========================================================================================================
    set_key_transform :camel_lower
    set_id { |record, params| record.slug }

  # Attributes
  # ==========================================================================================================
    attributes  :name,
                :title,
                :shown
                # :classes

  # Conditional Attributes
  # ==========================================================================================================

  # Virtual / Alias Attributes
  # ==========================================================================================================
    # attribute :page_status do |record|
    #   record.page_status.slug
    # end

    attribute :copy_blocks do |record|
      # record.copy_blocks
      # CopyBlockSerializer.new(record.copy_blocks, { is_collection: true })

      record.copy_blocks.map { |copy_block|
        abridged_copy_block = copy_block.slice(:content)
        abridged_copy_block[:id] = copy_block.slug
        abridged_copy_block[:classes] = copy_block.classes if copy_block.classes.present?

        # return
        abridged_copy_block
      }
    end

  # Associations
  # ==========================================================================================================
end
