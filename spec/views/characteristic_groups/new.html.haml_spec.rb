require 'rails_helper'

RSpec.describe "characteristic_groups/new", type: :view do
  before(:each) do
    assign(:characteristic_group, CharacteristicGroup.new())
  end

  it "renders new characteristic_group form" do
    render

    assert_select "form[action=?][method=?]", characteristic_groups_path, "post" do
    end
  end
end
