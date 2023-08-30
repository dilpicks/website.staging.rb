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
class TestIndexSerializer
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
                :name,
                :published_at,
                :shown

  # Conditional Attributes
  # ==========================================================================================================

  # Virtual / Alias Attributes
  # ==========================================================================================================
    attribute :link do |record|
      ilink = {
        type: 'route-link',
        href: 'test', # test_url(record),
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

    attribute :specimen do |record|
      abridged_specimen = 'N/A'

      specimen_characteristic = record.characteristics.find_by(characteristic_group_id: CharacteristicGroup::SPECIMEN_REQUIREMENTS, name: 'Specimen')

      if specimen_characteristic.present?
        abridged_specimen = specimen_characteristic.try(:copy_blocks).try(:first).try(:content)
      end

      # return
      abridged_specimen
    end

  # Associations
  # ==========================================================================================================
end
