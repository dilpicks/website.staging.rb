require 'rails_helper'

RSpec.describe "characteristics/index", type: :view do
  before(:each) do
    assign(:characteristics, [
      Characteristic.create!(),
      Characteristic.create!()
    ])
  end

  it "renders a list of characteristics" do
    render
  end
end
