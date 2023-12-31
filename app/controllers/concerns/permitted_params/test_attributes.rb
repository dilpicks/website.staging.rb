# include PermittedParams::TestTypeAttributes

module PermittedParams
  module TestAttributes
    extend ActiveSupport::Concern

    PERMITTED_PARAMS_TEST = [
      # ----------------------------------------------------------------------------------------------------------
      # Quasi-Universal Params
      # ----------------------------------------------------------------------------------------------------------
        :_destroy,

        :id,
        :slug,

        :created_at,
        :updated_at,

      # ----------------------------------------------------------------------------------------------------------
      # Other DB Backed Model Params
      # ----------------------------------------------------------------------------------------------------------
        :code,
        :name,
        :title,
        :shown,
        :available,
        :published_at,

      # ----------------------------------------------------------------------------------------------------------
      # `array`, `hstore`, and `jsonb` Column Types
      # ----------------------------------------------------------------------------------------------------------
        { cpt_codes: [] },

      # ----------------------------------------------------------------------------------------------------------
      # Alias Params
      # ----------------------------------------------------------------------------------------------------------

      # ----------------------------------------------------------------------------------------------------------
      # Virtual Params
      # ----------------------------------------------------------------------------------------------------------

      # ----------------------------------------------------------------------------------------------------------
      # `has_many` (Virtual & Alias Params)
      # ----------------------------------------------------------------------------------------------------------

      # ----------------------------------------------------------------------------------------------------------
      # `belongs_to`
      # ----------------------------------------------------------------------------------------------------------

      # ----------------------------------------------------------------------------------------------------------
      # `belongs_to` (Nested Params)
      # ----------------------------------------------------------------------------------------------------------
        # foo_nested_attributes

      # ----------------------------------------------------------------------------------------------------------
      # `has_one` (Polymorphic) - (Note "foo" vs "foos" – plural is for `has_many`)
      # ----------------------------------------------------------------------------------------------------------
        # { primary_image_attributes: PERMITTED_PARAMS_IMAGE },

      # ----------------------------------------------------------------------------------------------------------
      # `has_many` (Polymorphic)
      # ----------------------------------------------------------------------------------------------------------
        # { images_attributes: PERMITTED_PARAMS_IMAGE },
        # { copy_blocks_attributes: PERMITTED_PARAMS_COPY_BLOCK },
        # { characteristics_attributes: PERMITTED_PARAMS_CHARACTERISTIC },

      # ----------------------------------------------------------------------------------------------------------
      # `has_one` - (Note "fizz" vs "fizzs" – plural is for `has_many`)
      # ----------------------------------------------------------------------------------------------------------
        # fizz_nested_attributes

      # ----------------------------------------------------------------------------------------------------------
      # `has_many` - (Note only the top-level `has_many` is required. The permitted params for the `through` association is in it's respective `PermitedParams` module)
      # ----------------------------------------------------------------------------------------------------------
        ::PermittedParams::CharacteristicAttributes.characteristics_nested_attributes,

      # ----------------------------------------------------------------------------------------------------------
      # `has_many :through`
      # ----------------------------------------------------------------------------------------------------------
        ::PermittedParams::CharacteristicGroupAttributes.characteristic_group_ids
    ].freeze

    # ----------------------------------------------------------------------------------------------------------
    # has_one accepts_nested_attributes_for
    # ----------------------------------------------------------------------------------------------------------
      def self.test_nested_attributes
        { test_attributes: PERMITTED_PARAMS_TEST }
      end

    # ----------------------------------------------------------------------------------------------------------
    # has_many accepts_nested_attributes_for
    # ----------------------------------------------------------------------------------------------------------
      def self.tests_nested_attributes
        { tests_attributes: PERMITTED_PARAMS_TEST }
      end

    # ----------------------------------------------------------------------------------------------------------
    # `has_many :through`
    # ----------------------------------------------------------------------------------------------------------
      def self.test_ids
        { test_ids: [] }
      end
  end
end
