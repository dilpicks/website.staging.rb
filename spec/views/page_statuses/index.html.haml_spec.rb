require 'rails_helper'

RSpec.describe "page_statuses/index", type: :view do
  before(:each) do
    assign(:page_statuses, [
      PageStatus.create!(),
      PageStatus.create!()
    ])
  end

  it "renders a list of page_statuses" do
    render
  end
end
