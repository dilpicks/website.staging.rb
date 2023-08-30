# frozen_string_literal: true

# == Schema Information
#
# Table name: people
#
#  bio         :text
#  created_at  :datetime         not null
#  featured    :boolean          default(FALSE), not null
#  id          :bigint           not null, primary key
#  link        :text
#  name        :string(255)      not null
#  slug        :string
#  summary     :text
#  team_member :boolean          default(FALSE), not null
#  title       :string(255)
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_people_on_slug  (slug) UNIQUE
#
class PersonSerializer
  include JSONAPI::Serializer

  # Config
  # ==========================================================================================================
    set_key_transform :camel_lower
    set_id { |record, params| record.slug }

  # Attributes
  # ==========================================================================================================
    attributes  :name,
                # :summary, # Aliased :summary to `content`
                # :slug, # Aliased to `id`
                :team_member,
                :featured,
                :title,
                # :bio,
                # :image,
                :link

  # Conditional Attributes
  # ==========================================================================================================

  # Virtual / Alias Attributes
  # ==========================================================================================================
    attribute :link do |record|
      if record.link.present?
        {
          type: 'external',
          href: record.link
        }
      end
    end

    # Alias of `summary`
    attribute :content do |record|
      record.summary.presence || record.bio.presence
    end

    attribute :article_count do |record|
      record.articles.count || 0
    end

    attribute :image do |record|
      abridged_image = nil

      if record.image.present?
        abridged_image = record.image.slice(:src)
        abridged_image[:id] = record.image.slug if record.image.slug.present?
        abridged_image[:title] = record.image.title if record.image.title.present?
        abridged_image[:alt] = record.image.alt if record.image.alt.present?
        abridged_image[:width] = record.image.width if record.image.width.present?
        abridged_image[:height] = record.image.height if record.image.height.present?
        abridged_image[:classes] = record.image.classes if record.image.classes.present?
      end

      # return
      abridged_image
    end

  # Associations
  # ==========================================================================================================
    # has_one :image, if: proc { |record| record.image.present? } # , serializer: ImageSerializer
end
