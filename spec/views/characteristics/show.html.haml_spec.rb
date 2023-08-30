require 'rails_helper'

RSpec.describe "characteristics/show", type: :view do
  before(:each) do
    @characteristic = assign(:characteristic, Characteristic.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
