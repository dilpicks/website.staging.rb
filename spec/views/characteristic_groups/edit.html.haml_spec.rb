require 'rails_helper'

RSpec.describe "characteristic_groups/edit", type: :view do
  before(:each) do
    @characteristic_group = assign(:characteristic_group, CharacteristicGroup.create!())
  end

  it "renders the edit characteristic_group form" do
    render

    assert_select "form[action=?][method=?]", characteristic_group_path(@characteristic_group), "post" do
    end
  end
end
