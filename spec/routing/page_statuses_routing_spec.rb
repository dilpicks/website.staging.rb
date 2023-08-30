# == Schema Information
#
# Table name: page_statuses
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string(255)      not null
#  slug       :string
#
# Indexes
#
#  index_page_statuses_on_slug    (slug) UNIQUE
#  index_page_statuses_on_status  (status) UNIQUE
#
require "rails_helper"

RSpec.describe PageStatusesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/page_statuses").to route_to("page_statuses#index")
    end

    it "routes to #new" do
      expect(get: "/page_statuses/new").to route_to("page_statuses#new")
    end

    it "routes to #show" do
      expect(get: "/page_statuses/1").to route_to("page_statuses#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/page_statuses/1/edit").to route_to("page_statuses#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/page_statuses").to route_to("page_statuses#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/page_statuses/1").to route_to("page_statuses#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/page_statuses/1").to route_to("page_statuses#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/page_statuses/1").to route_to("page_statuses#destroy", id: "1")
    end
  end
end
