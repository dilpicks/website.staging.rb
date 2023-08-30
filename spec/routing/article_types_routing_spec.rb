# == Schema Information
#
# Table name: article_types
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  kind       :string(255)      not null
#  slug       :string
#
# Indexes
#
#  index_article_types_on_kind  (kind) UNIQUE
#  index_article_types_on_slug  (slug) UNIQUE
#
require "rails_helper"

RSpec.describe ArticleTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/article_types").to route_to("article_types#index")
    end

    it "routes to #new" do
      expect(get: "/article_types/new").to route_to("article_types#new")
    end

    it "routes to #show" do
      expect(get: "/article_types/1").to route_to("article_types#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/article_types/1/edit").to route_to("article_types#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/article_types").to route_to("article_types#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/article_types/1").to route_to("article_types#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/article_types/1").to route_to("article_types#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/article_types/1").to route_to("article_types#destroy", id: "1")
    end
  end
end
