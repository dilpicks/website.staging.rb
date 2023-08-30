require 'rails_helper'

RSpec.describe "page_statuses/new", type: :view do
  before(:each) do
    assign(:page_status, PageStatus.new())
  end

  it "renders new page_status form" do
    render

    assert_select "form[action=?][method=?]", page_statuses_path, "post" do
    end
  end
end
