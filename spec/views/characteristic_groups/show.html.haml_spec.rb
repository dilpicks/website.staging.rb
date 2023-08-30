require 'rails_helper'

RSpec.describe "characteristic_groups/show", type: :view do
  before(:each) do
    @characteristic_group = assign(:characteristic_group, CharacteristicGroup.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
