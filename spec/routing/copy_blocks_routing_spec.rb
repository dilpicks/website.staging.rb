# == Schema Information
#
# Table name: copy_blocks
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  contentable_type :string           not null
#  contentable_id   :bigint           not null
#  active           :boolean          default(TRUE), not null
#  content          :text
#  classes          :text             default([]), is an Array
#  slug             :string
#
# Indexes
#
#  index_copy_blocks_on_contentable  (contentable_type,contentable_id)
#  index_copy_blocks_on_slug         (slug) UNIQUE
#
require "rails_helper"

RSpec.describe CopyBlocksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/copy_blocks").to route_to("copy_blocks#index")
    end

    it "routes to #new" do
      expect(get: "/copy_blocks/new").to route_to("copy_blocks#new")
    end

    it "routes to #show" do
      expect(get: "/copy_blocks/1").to route_to("copy_blocks#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/copy_blocks/1/edit").to route_to("copy_blocks#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/copy_blocks").to route_to("copy_blocks#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/copy_blocks/1").to route_to("copy_blocks#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/copy_blocks/1").to route_to("copy_blocks#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/copy_blocks/1").to route_to("copy_blocks#destroy", id: "1")
    end
  end
end
