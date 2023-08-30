# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string(255)      not null
#  classes     :string           default([]), is an Array
#  occurred_at :datetime
#  event_id    :bigint
#  slug        :string
#
# Indexes
#
#  index_events_on_event_id  (event_id)
#  index_events_on_slug      (slug) UNIQUE
#
class Event < ApplicationRecord
# Constants
  # ==========================================================================================================

  # Extensions
  # ==========================================================================================================
    extend FriendlyId
    friendly_id :slug_candidates,
                use: :slugged

  # Concerns / Includes / Presenters
  # ==========================================================================================================

  # Alias Attributes
  # ==========================================================================================================

  # Virtual Attributes
  # ==========================================================================================================

  # belongs_to: [MODEL] (Polymorphic)
  # ==========================================================================================================

  # belongs_to: Event (self-referential)
  # ==========================================================================================================
    belongs_to  :event,
                inverse_of: :events,
                optional: true

  # has_one: [MODEL] (Polymorphic)
  # ==========================================================================================================

  # has_one: [MODEL]
  # ==========================================================================================================

  # has_many: Images (Polymorphic)
  # ==========================================================================================================
    has_many  :images, -> { order(:id) },
              as: :imageable,
              dependent: :destroy

    accepts_nested_attributes_for :images,
                                  allow_destroy: true,
                                  reject_if: proc { |attributes|
                                    attributes['src'].blank?
                                  }

    has_one :primary_image,
            -> { where(primary: true) },
            as: :imageable,
            class_name: 'Image'

    has_one :thumbnail_image,
            -> { where(primary: false) },
            as: :imageable,
            class_name: 'Image'

  # has_many: CopyBlocks (Polymorphic)
  # ==========================================================================================================
    has_many  :copy_blocks, -> { order(:id) },
              as: :contentable,
              dependent: :destroy

    accepts_nested_attributes_for :copy_blocks,
                                  allow_destroy: true,
                                  reject_if: proc { |attributes|
                                    attributes['content'].blank?
                                  }

  # has_many: ArticleAuthors > Authors
  # ==========================================================================================================
    has_many  :events,
              inverse_of: :event

    accepts_nested_attributes_for :events,
                                  allow_destroy: true,
                                  reject_if: proc { |attributes|
                                    attributes['events_attributes'].blank? &&
                                    attributes['copy_blocks_attributes'].blank?
                                  }

  # Scopes
  # ==========================================================================================================
    # scope :by_event_group, -> (event_group_slugs = nil) {
    #   event_group_ids = event_group_slugs.present? ? Event.where(slug: event_group_slugs).pluck(:id) : Event.all.pluck(:id)

    #   where(
    #     event_group_id: event_group_ids
    #   ).order(
    #     featured: :desc,
    #     published_at: :desc
    #   )
    # }

  # Filter Scopes
  # ==========================================================================================================

  # Callbacks
  # ==========================================================================================================

  # Validations
  # ==========================================================================================================
    # validates :title,
    #           presence: true

  # Custom Validations
  # ==========================================================================================================

  # **********************************************************************************************************
  # -------------------------------------------- PUBLIC METHODS ----------------------------------------------
  # **********************************************************************************************************

  # Public Custom Callback Methods
  # ==========================================================================================================

  # Public Custom Validation Methods
  # ==========================================================================================================

  # Public Instance Methods
  # ==========================================================================================================

  # Public Class Methods
  # ==========================================================================================================

  # **********************************************************************************************************
  # ------------------------------------------- PROTECTED METHODS --------------------------------------------
  # **********************************************************************************************************
    protected

  # Protected Custom Callback Methods
  # ==========================================================================================================

  # Protected Custom Validation Methods
  # ==========================================================================================================

  # Protected Instance Methods
  # ==========================================================================================================
  def slug_candidates
      attribute_candidates = []
      attribute_candidates.push(ActionView::Base.full_sanitizer.sanitize(title).gsub(/[’–“”—&]/, '')) if title.present?

      # return
      [
        attribute_candidates
      ]
    end

  # Protected Class Methods
  # ==========================================================================================================

  # **********************************************************************************************************
  # -------------------------------------------- PRIVATE METHODS ---------------------------------------------
  # **********************************************************************************************************
    private

  # Private Custom Callback Methods
  # ==========================================================================================================

  # Private Custom Validation Methods
  # ==========================================================================================================

  # Private Instance Methods
  # ==========================================================================================================

  # Private Class Methods
  # ==========================================================================================================
end

