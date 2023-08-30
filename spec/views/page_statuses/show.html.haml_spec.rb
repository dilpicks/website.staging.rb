require 'rails_helper'

RSpec.describe "page_statuses/show", type: :view do
  before(:each) do
    @page_status = assign(:page_status, PageStatus.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
