require 'rails_helper'

RSpec.describe "page_statuses/edit", type: :view do
  before(:each) do
    @page_status = assign(:page_status, PageStatus.create!())
  end

  it "renders the edit page_status form" do
    render

    assert_select "form[action=?][method=?]", page_status_path(@page_status), "post" do
    end
  end
end
