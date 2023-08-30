require 'rails_helper'

RSpec.describe "characteristic_groups/index", type: :view do
  before(:each) do
    assign(:characteristic_groups, [
      CharacteristicGroup.create!(),
      CharacteristicGroup.create!()
    ])
  end

  it "renders a list of characteristic_groups" do
    render
  end
end
