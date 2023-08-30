# == Schema Information
#
# Table name: characteristic_groups
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  name       :string(255)      not null
#  title      :string(255)
#  order      :integer          default(0), not null
#  shown      :boolean          default(TRUE), not null
#
# Indexes
#
#  index_characteristic_groups_on_slug  (slug) UNIQUE
#
require "rails_helper"

RSpec.describe CharacteristicGroupsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/characteristic_groups").to route_to("characteristic_groups#index")
    end

    it "routes to #new" do
      expect(get: "/characteristic_groups/new").to route_to("characteristic_groups#new")
    end

    it "routes to #show" do
      expect(get: "/characteristic_groups/1").to route_to("characteristic_groups#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/characteristic_groups/1/edit").to route_to("characteristic_groups#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/characteristic_groups").to route_to("characteristic_groups#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/characteristic_groups/1").to route_to("characteristic_groups#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/characteristic_groups/1").to route_to("characteristic_groups#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/characteristic_groups/1").to route_to("characteristic_groups#destroy", id: "1")
    end
  end
end
