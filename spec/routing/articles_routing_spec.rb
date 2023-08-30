# == Schema Information
#
# Table name: articles
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  title            :string(255)      not null
#  link             :text
#  source           :string(255)
#  classes          :string           default([]), is an Array
#  page_status_id   :bigint           not null
#  slug             :string
#  article_type_id  :bigint           not null
#  published_at     :datetime
#  featured         :boolean          default(TRUE), not null
#  summary          :text
#  subtitle         :string(255)
#  meta_title       :string(255)
#  meta_description :text
#  location         :text
#
# Indexes
#
#  index_articles_on_article_type_id  (article_type_id)
#  index_articles_on_page_status_id   (page_status_id)
#  index_articles_on_slug             (slug) UNIQUE
#  index_articles_on_title            (title) UNIQUE
#
require "rails_helper"

RSpec.describe ArticlesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/articles").to route_to("articles#index")
    end

    it "routes to #new" do
      expect(get: "/articles/new").to route_to("articles#new")
    end

    it "routes to #show" do
      expect(get: "/articles/1").to route_to("articles#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/articles/1/edit").to route_to("articles#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/articles").to route_to("articles#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/articles/1").to route_to("articles#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/articles/1").to route_to("articles#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/articles/1").to route_to("articles#destroy", id: "1")
    end
  end
end
