# frozen_string_literal: true

# == Schema Information
#
# Table name: tests
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slug         :string
#  name         :string(255)      not null
#  title        :string(255)
#  code         :string(255)      not null
#  cpt_codes    :text             default([]), is an Array
#  shown        :boolean          default(TRUE), not null
#  available    :boolean          default(TRUE), not null
#  published_at :datetime
#
# Indexes
#
#  index_tests_on_slug  (slug) UNIQUE
#
class TestShowSerializer
  include Rails.application.routes.url_helpers
  include JSONAPI::Serializer

  # Config
  # ==========================================================================================================
    set_key_transform :camel_lower
    set_id { |record, params| record.slug }

  # Attributes
  # ==========================================================================================================
    attributes  :available,
                :code,
                :cpt_codes,
                :name,
                :published_at,
                :shown,
                :title

  # Conditional Attributes
  # ==========================================================================================================

  # Virtual / Alias Attributes
  # ==========================================================================================================
    attribute :link do |record|
      ilink = {
        type: 'route-link',
        href: 'test',
        params: {
          id: record.slug
        }
      }

      # return
      ilink
    end

    attribute :published_date do |record|
      record.published_at.strftime('%m/%d/%Y')
    end


    attribute :characteristic_groups do |record|
      abridged_characteristic_groups = []

      record.characteristics.by_displayable.each do |characteristic|
        abridged_characteristic_group = abridged_characteristic_groups.detect { |characteristic_group| characteristic_group[:id] == characteristic.characteristic_group.slug }

        if abridged_characteristic_group.blank?
          abridged_characteristic_group = {
            id: characteristic.characteristic_group.slug,
            name: characteristic.characteristic_group.display_name,
            order: characteristic.characteristic_group.order,
            characteristics: []
          }

          abridged_characteristic_groups.push(abridged_characteristic_group)
        end

        abridged_characteristic = {
          id: characteristic.slug,
          name: characteristic.display_name,
          shown: characteristic.shown,
          order: characteristic.order,
          copy_blocks: characteristic.copy_blocks.map { |copy_block|
            # return
            {
              id: copy_block.slug,
              content: copy_block.content,
              classes: copy_block.classes.present? ? copy_block.classes : []
            }
          }
        }.deep_transform_keys! { |key| key.to_s.camelize(:lower) }

        abridged_characteristic_group[:characteristics].push(abridged_characteristic)
      end

      # return
      abridged_characteristic_groups
    end

  # Associations
  # ==========================================================================================================
end

module FastJsonapi
  module ObjectSerializer
    class_methods do
      def override_type(type_name = nil, &block)
        self.record_type = block || type_name
      end
    end
  end
end
