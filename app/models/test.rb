# == Schema Information
#
# Table name: tests
#
#  available    :boolean          default(TRUE), not null
#  code         :string(255)      not null
#  cpt_codes    :text             default([]), is an Array
#  created_at   :datetime         not null
#  id           :bigint           not null, primary key
#  name         :string(255)      not null
#  published_at :datetime
#  shown        :boolean          default(TRUE), not null
#  slug         :string
#  title        :string(255)
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_tests_on_slug  (slug) UNIQUE
#
# ActiveRecord::Base.connection.execute("TRUNCATE TABLE tests, images, characteristics, characteristic_groups RESTART IDENTITY")
class Test < ApplicationRecord
  # Constants
  # ==========================================================================================================

  # Extensions
  # ==========================================================================================================
    extend FriendlyId
    friendly_id :slug_candidates,
                use: :slugged

  # Concerns / Includes / Presenters
  # ==========================================================================================================
    include Presenters::NameifyPresenter

  # Alias Attributes
  # ==========================================================================================================

  # Virtual Attributes
  # ==========================================================================================================

  # belongs_to: [MODEL] (Polymorphic)
  # ==========================================================================================================

  # belongs_to: [MODEL]
  # ==========================================================================================================

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

  # has_many: Characteristics
  # ==========================================================================================================
    has_many  :characteristics,
              inverse_of: :test

    has_many  :characteristic_groups,
              through: :characteristics,
              inverse_of: :characteristics

    accepts_nested_attributes_for :characteristics,
                                  allow_destroy: true,
                                  reject_if: proc { |attributes|
                                    attributes['characteristic_group_id'].blank?
                                  }

  # Scopes
  # ==========================================================================================================
    scope :by_displayable, -> (slugs = nil) {
      where_params = { available: true, shown: true }
      where_params[:slug] = slugs if slugs.present?

      where(
        where_params
      ).order(
        code: :desc
      )
    }

  # Filter Scopes
  # ==========================================================================================================

  # Callbacks
  # ==========================================================================================================

  # Validations
  # ==========================================================================================================
    validates :name,
              presence: true,
              uniqueness: true

    validates :code,
              presence: true,
              uniqueness: true

    # validates :cpt_codes,
    #           presence: true

    # validates :test,
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
      attribute_candidates.push(ActionView::Base.full_sanitizer.sanitize(name).gsub(/[’–“”—&]/, '')) if name.present?

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
