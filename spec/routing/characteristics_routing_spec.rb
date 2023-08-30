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
require "rails_helper"

RSpec.describe CharacteristicsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/characteristics").to route_to("characteristics#index")
    end

    it "routes to #new" do
      expect(get: "/characteristics/new").to route_to("characteristics#new")
    end

    it "routes to #show" do
      expect(get: "/characteristics/1").to route_to("characteristics#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/characteristics/1/edit").to route_to("characteristics#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/characteristics").to route_to("characteristics#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/characteristics/1").to route_to("characteristics#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/characteristics/1").to route_to("characteristics#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/characteristics/1").to route_to("characteristics#destroy", id: "1")
    end
  end
end
