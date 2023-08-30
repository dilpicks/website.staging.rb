require 'rails_helper'

RSpec.describe "characteristics/new", type: :view do
  before(:each) do
    assign(:characteristic, Characteristic.new())
  end

  it "renders new characteristic form" do
    render

    assert_select "form[action=?][method=?]", characteristics_path, "post" do
    end
  end
end
