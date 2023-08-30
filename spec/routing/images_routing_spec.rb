# == Schema Information
#
# Table name: images
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  src            :text             not null
#  title          :string(255)
#  alt            :string(255)
#  width          :integer
#  height         :integer
#  classes        :text             default([]), is an Array
#  imageable_type :string
#  imageable_id   :bigint
#  slug           :string
#  primary        :boolean          default(FALSE), not null
#
# Indexes
#
#  index_images_on_imageable                                    (imageable_type,imageable_id)
#  index_images_on_primary_and_imageable_id_and_imageable_type  (primary,imageable_id,imageable_type) UNIQUE WHERE ("primary" = true)
#  index_images_on_slug                                         (slug) UNIQUE
#
require "rails_helper"

RSpec.describe ImagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/images").to route_to("images#index")
    end

    it "routes to #new" do
      expect(get: "/images/new").to route_to("images#new")
    end

    it "routes to #show" do
      expect(get: "/images/1").to route_to("images#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/images/1/edit").to route_to("images#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/images").to route_to("images#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/images/1").to route_to("images#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/images/1").to route_to("images#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/images/1").to route_to("images#destroy", id: "1")
    end
  end
end
