# frozen_string_literal: true

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
class ImageSerializer
  include JSONAPI::Serializer

  # Config
  # ==========================================================================================================
    set_key_transform :camel_lower
    set_id { |record, params| record.slug }

  # Attributes
  # ==========================================================================================================
    attributes  :src,
                :title,
                :alt,
                :width,
                :height,
                :classes,
                :primary

  # Conditional Attributes
  # ==========================================================================================================
    attribute :title, if: proc { |record|
      record.title.present?
    }

    attribute :alt, if: proc { |record|
      record.alt.present?
    }

    attribute :width, if: proc { |record|
      record.width.present?
    }

    attribute :height, if: proc { |record|
      record.height.present?
    }

    attribute :classes, if: proc { |record|
      record.classes.present?
    }

  # Virtual / Alias Attributes
  # ===============================================================================================

  # Associations
  # ===============================================================================================
end
