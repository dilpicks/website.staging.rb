# == Schema Information
#
# Table name: article_authors
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint
#  article_id :bigint
#
# Indexes
#
#  index_article_authors_on_article_id                (article_id)
#  index_article_authors_on_article_id_and_author_id  (article_id,author_id) UNIQUE
#  index_article_authors_on_author_id                 (author_id)
#
require "rails_helper"

RSpec.describe ArticleAuthorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/article_authors").to route_to("article_authors#index")
    end

    it "routes to #new" do
      expect(get: "/article_authors/new").to route_to("article_authors#new")
    end

    it "routes to #show" do
      expect(get: "/article_authors/1").to route_to("article_authors#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/article_authors/1/edit").to route_to("article_authors#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/article_authors").to route_to("article_authors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/article_authors/1").to route_to("article_authors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/article_authors/1").to route_to("article_authors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/article_authors/1").to route_to("article_authors#destroy", id: "1")
    end
  end
end
