# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  article_type_id  :bigint           not null
#  classes          :string           default([]), is an Array
#  created_at       :datetime         not null
#  featured         :boolean          default(TRUE), not null
#  id               :bigint           not null, primary key
#  link             :text
#  location         :text
#  meta_description :text
#  meta_title       :string(255)
#  page_status_id   :bigint           not null
#  published_at     :datetime
#  slug             :string
#  source           :string(255)
#  subtitle         :string(255)
#  summary          :text
#  title            :string(255)      not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_articles_on_article_type_id  (article_type_id)
#  index_articles_on_page_status_id   (page_status_id)
#  index_articles_on_slug             (slug) UNIQUE
#  index_articles_on_title            (title) UNIQUE
#
class ArticleSerializer
  include Rails.application.routes.url_helpers

  # class << self
  #   attr_accessor :foo
  # end

  # def self.set_foo(id_name = nil, &block)
  #   self.foo = block || id_name
  # end

  include JSONAPI::Serializer

  # Config
  # ==========================================================================================================
    set_key_transform :camel_lower
    set_id { |record, params| record.slug }

    # t = self.get_type { |record| record.article_type }

    # set_type t  #@resource.article_type_id == ArticleType::PUBLICATION ? 'card' : @resource.article_type.slug

    # article_record = Article.find(self.record_id.to_i)

    # self.record_type = { |record| article_record.article_type_id == ArticleType::PUBLICATION ? 'card' : article_record.article_type.slug }
    # self.record_type = yield { |record| 'foo' }

  # Attributes
  # ==========================================================================================================
    attributes  :title,
                :link,
                :source,
                :classes,
                # :page_status_id, # Aliased page_status.slug to `page_status`
                # :slug, # Aliased to `id`
                # :article_type_id, # Aliased article_type.slug to `article_type`
                :published_at,
                :featured,
                # :summary, # Aliased :summary to `content`
                :subtitle,
                :meta_title,
                :meta_description,
                :location

  # Conditional Attributes
  # ==========================================================================================================
    # attribute :content, if: Proc.new { |record|
    #   record.content.present?
    # }

    # attribute :link, if: Proc.new { |record|
    #   record.link.present?
    # }

    attribute :source, if: Proc.new { |record|
      record.source.present?
    }

    attribute :classes, if: Proc.new { |record|
      record.classes.present?
    }

    # attribute :summary, if: Proc.new { |record|
    #   record.summary.present?
    # }

    attribute :subtitle, if: Proc.new { |record|
      record.subtitle.present?
    }

    attribute :meta_title, if: Proc.new { |record|
      record.meta_title.present?
    }

    attribute :meta_description, if: Proc.new { |record|
      record.meta_description.present?
    }

    attribute :location, if: Proc.new { |record|
      record.location.present?
    }

    # attribute :primary_image, if: Proc.new { |record|
    #   record.primary_image.present?
    # }

  # Virtual / Alias Attributes
  # ==========================================================================================================
    # attribute :link do |record|
    #   ilink = {
    #     type: 'external'
    #   }

    #   if record.link.present?
    #     ilink[:href] = record.link
    #   else
    #     ilink[:href] = article_url(record)
    #   end
    # end

    attribute :image do |record|
      abridged_image = nil

      if record.primary_image.present?
        abridged_image = record.primary_image.slice(:src)
        abridged_image[:id] = record.primary_image.slug if record.primary_image.slug.present?
        abridged_image[:title] = record.primary_image.title if record.primary_image.title.present?
        abridged_image[:alt] = record.primary_image.alt if record.primary_image.alt.present?
        abridged_image[:width] = record.primary_image.width if record.primary_image.width.present?
        abridged_image[:height] = record.primary_image.height if record.primary_image.height.present?
        abridged_image[:classes] = record.primary_image.classes if record.primary_image.classes.present?
      end

      # return
      abridged_image
    end

    attribute :thumbnail do |record|
      abridged_image = nil

      if record.thumbnail_image.present?
        abridged_image = record.thumbnail_image.slice(:src)
        abridged_image[:id] = record.thumbnail_image.slug if record.thumbnail_image.slug.present?
        abridged_image[:title] = record.thumbnail_image.title if record.thumbnail_image.title.present?
        abridged_image[:alt] = record.thumbnail_image.alt if record.thumbnail_image.alt.present?
        abridged_image[:width] = record.thumbnail_image.width if record.thumbnail_image.width.present?
        abridged_image[:height] = record.thumbnail_image.height if record.thumbnail_image.height.present?
        abridged_image[:classes] = record.thumbnail_image.classes if record.thumbnail_image.classes.present?
      end

      # return
      abridged_image
    end

    attribute :link do |record|
      abridged_link = nil

      if record.link.present?
        abridged_link = { href: record.link, type: 'external', classes: ['article-link'] }
      else
        abridged_link = {
          href: 'article',
          type: 'route-link',
          classes: ['article-link'],
          params: {
            id: record.slug
          }
        }
      end

      # return
      abridged_link
    end

    attribute :content do |record|
      record.summary
    end

    # attribute :component_type do |record|
    #   record.article_type_id == ArticleType::PRESS_RELEASE ? 'card' : 'article'
    # end

    attribute :page_status do |record|
      record.page_status.slug
    end

    attribute :article_type do |record|
      record.article_type.slug
    end

    attribute :published_date do |record|
      record.published_at.strftime('%m/%d/%Y')
    end

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
    # has_many :copy_blocks

    # has_many :images, if: Proc.new { |record| record.images.length > 1 }

  #   # if ENV.fetch('RUN_AS_ENV') { 'staging' } == 'localhost'
  #   Rails.logger.debug ''
  #   Rails.logger.debug '###########################################################################'
  #   Rails.logger.debug "#{self.name} - #{ap self.ancestors}"
  #   # Rails.logger.debug "#{self.name} - #{ap record_type}"
  #   # temp = self
  #   # Rails.logger.debug "#{self.name} - #{Proc.new { |record| temp.record_type = 'foo' }}"
  #   Rails.logger.debug "#{self.name} - #{ap self.class_variables}"
  #   Rails.logger.debug "#{self.name} - #{ap self.ancestors[1]}"
  #   # Rails.logger.debug "#{self.name} - #{ap @record_type}"
  #   set_foo { |record, params| 'wtf' }
  #   Rails.logger.debug "#{self.name} - #{ap self.foo}"
  #   # Rails.logger.debug "#{self.name} - #{ap options}"
  #   # Rails.logger.debug '==========================================================================='
  #   # Rails.logger.debug "#{self.name} - #{__method__} - params:"
  #   # Rails.logger.debug "#{ap params}"
  #   # Rails.logger.debug '---------------------------------------------------------------------------'
  #   # Rails.logger.debug "#{self.name} - #{__method__} - matching_airport:"
  #   # Rails.logger.debug "#{ap matching_airport}"
  #   # Rails.logger.debug '---------------------------------------------------------------------------'
  #   # Rails.logger.debug "#{self.name} - #{__method__} - user.airport:"
  #   # Rails.logger.debug "#{ap user.airport}"
  #   Rails.logger.debug '###########################################################################'
  #   Rails.logger.debug ''
  # # end
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
