# == Schema Information
#
# Table name: people
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string(255)      not null
#  bio         :text
#  slug        :string
#  team_member :boolean          default(FALSE), not null
#  featured    :boolean          default(FALSE), not null
#  title       :string(255)
#  summary     :text
#  link        :text
#
# Indexes
#
#  index_people_on_slug  (slug) UNIQUE
#
require "rails_helper"

RSpec.describe PeopleController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/people").to route_to("people#index")
    end

    it "routes to #new" do
      expect(get: "/people/new").to route_to("people#new")
    end

    it "routes to #show" do
      expect(get: "/people/1").to route_to("people#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/people/1/edit").to route_to("people#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/people").to route_to("people#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/people/1").to route_to("people#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/people/1").to route_to("people#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/people/1").to route_to("people#destroy", id: "1")
    end
  end
end
