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
# ActiveRecord::Base.connection.execute("TRUNCATE TABLE articles, images, article_authors RESTART IDENTITY")
class Article < ApplicationRecord
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

  # belongs_to: ArticleType
  # ==========================================================================================================
    belongs_to  :article_type,
                inverse_of: :articles,
                optional: false

  # belongs_to: PageStatus
  # ==========================================================================================================
    belongs_to  :page_status,
                inverse_of: :articles,
                optional: false

  # has_one: [MODEL] (Polymorphic)
  # ==========================================================================================================

  # has_one: [MODEL]
  # ==========================================================================================================

  # has_many: Images (Polymorphic)
  # ==========================================================================================================
    has_many  :images, -> { order(:id) },
              as: :imageable,
              # inverse_of: :article,
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
    has_many  :article_authors,
              inverse_of: :article

    has_many  :authors,
              class_name: 'Person',
              through: :article_authors,
              inverse_of: :article_authors

    accepts_nested_attributes_for :article_authors,
                                  allow_destroy: true,
                                  reject_if: proc { |attributes|
                                    attributes['author_id'].blank?
                                  }

  # Scopes
  # ==========================================================================================================
    scope :by_article_type, -> (article_type_slugs = nil) {
      article_type_ids = article_type_slugs.present? ? ArticleType.where(slug: article_type_slugs).pluck(:id) : ArticleType.all.pluck(:id)

      where(
        article_type_id: article_type_ids
      ).order(
        featured: :desc,
        published_at: :desc
      )
    }

  # Filter Scopes
  # ==========================================================================================================

  # Callbacks
  # ==========================================================================================================

  # Validations
  # ==========================================================================================================
    validates :title,
              presence: true,
              uniqueness: true

    validates :article_type,
              presence: true

    validates :page_status,
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
