# frozen_string_literal: true

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
class CopyBlockSerializer
  include JSONAPI::Serializer

  # Config
  # ==========================================================================================================
    set_key_transform :camel_lower
    set_id { |record, params| record.slug }

  # Attributes
  # ==========================================================================================================
    attributes  :active,
                :content,
                :classes,
                :contentable_id,
                :contentable_type

  # Conditional Attributes
  # ==========================================================================================================
    attribute :classes, if: Proc.new { |record|
      record.classes.present?
    }

  # Virtual / Alias Attributes
  # ===============================================================================================

  # Associations
  # ===============================================================================================
end
