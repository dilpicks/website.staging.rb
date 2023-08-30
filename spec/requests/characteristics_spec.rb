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
require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/characteristics", type: :request do
  
  # Characteristic. As you add validations to Characteristic, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Characteristic.create! valid_attributes
      get characteristics_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      characteristic = Characteristic.create! valid_attributes
      get characteristic_url(characteristic)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_characteristic_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      characteristic = Characteristic.create! valid_attributes
      get edit_characteristic_url(characteristic)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Characteristic" do
        expect {
          post characteristics_url, params: { characteristic: valid_attributes }
        }.to change(Characteristic, :count).by(1)
      end

      it "redirects to the created characteristic" do
        post characteristics_url, params: { characteristic: valid_attributes }
        expect(response).to redirect_to(characteristic_url(Characteristic.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Characteristic" do
        expect {
          post characteristics_url, params: { characteristic: invalid_attributes }
        }.to change(Characteristic, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post characteristics_url, params: { characteristic: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested characteristic" do
        characteristic = Characteristic.create! valid_attributes
        patch characteristic_url(characteristic), params: { characteristic: new_attributes }
        characteristic.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the characteristic" do
        characteristic = Characteristic.create! valid_attributes
        patch characteristic_url(characteristic), params: { characteristic: new_attributes }
        characteristic.reload
        expect(response).to redirect_to(characteristic_url(characteristic))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        characteristic = Characteristic.create! valid_attributes
        patch characteristic_url(characteristic), params: { characteristic: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested characteristic" do
      characteristic = Characteristic.create! valid_attributes
      expect {
        delete characteristic_url(characteristic)
      }.to change(Characteristic, :count).by(-1)
    end

    it "redirects to the characteristics list" do
      characteristic = Characteristic.create! valid_attributes
      delete characteristic_url(characteristic)
      expect(response).to redirect_to(characteristics_url)
    end
  end
end
