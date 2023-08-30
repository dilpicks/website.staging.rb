# == Schema Information
#
# Table name: characteristics
#
#  id                      :bigint           not null, primary key
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  slug                    :string
#  name                    :string(255)      not null
#  title                   :string(255)
#  shown                   :boolean          default(TRUE), not null
#  characteristic_group_id :bigint           not null
#  test_id                 :bigint           not null
#  order                   :integer          default(0), not null
#
# Indexes
#
#  index_characteristics_on_characteristic_group_id  (characteristic_group_id)
#  index_characteristics_on_slug                     (slug) UNIQUE
#  index_characteristics_on_test_id                  (test_id)
#
class Characteristic < ApplicationRecord
  # Constants
  # ==========================================================================================================

  # Extensions
  # ==========================================================================================================
    extend FriendlyId
    friendly_id :slug_candidates, use: :slugged

  # Concerns / Includes / Presenters
  # ==========================================================================================================
    include Presenters::NameifyPresenter

  # Alias Attributes
  # ==========================================================================================================

  # Virtual Attributes
  # ==========================================================================================================

  # belongs_to: [MODEL] (Polymorphic)
  # ==========================================================================================================

  # belongs_to: Test
  # ==========================================================================================================
    belongs_to  :test,
                inverse_of: :characteristics

  # belongs_to: CharacteristicGroup
  # ==========================================================================================================

    belongs_to  :characteristic_group,
                inverse_of: :characteristics

  # has_one: [MODEL] (Polymorphic)
  # ==========================================================================================================

  # has_one: [MODEL]
  # ==========================================================================================================

  # has_many: [MODELS] (Polymorphic)
  # ==========================================================================================================

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

  # Scopes
  # ==========================================================================================================
    scope :by_displayable, -> () {
      includes(
        :copy_blocks
      ).where(
        shown: true
      ).where.not(
        copy_blocks: {
          contentable_id: nil
        }
      ).order(
        order: :asc
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
              uniqueness: {
                scope: [
                  :test,
                  :characteristic_group
                ]
              }

    validates :test,
              presence: true

    validates :characteristic_group,
              presence: true

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
      attribute_candidates.push(characteristic_group.try(:name)) if characteristic_group.present?
      attribute_candidates.push(test.try(:name)) if test.present?
      attribute_candidates.push(name)

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

