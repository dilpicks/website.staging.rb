require 'rails_helper'

RSpec.describe "copy_blocks/new", type: :view do
  before(:each) do
    assign(:copy_block, CopyBlock.new())
  end

  it "renders new copy_block form" do
    render

    assert_select "form[action=?][method=?]", copy_blocks_path, "post" do
    end
  end
end
