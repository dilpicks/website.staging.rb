require 'rails_helper'

RSpec.describe "characteristics/edit", type: :view do
  before(:each) do
    @characteristic = assign(:characteristic, Characteristic.create!())
  end

  it "renders the edit characteristic form" do
    render

    assert_select "form[action=?][method=?]", characteristic_path(@characteristic), "post" do
    end
  end
end
