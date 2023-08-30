require 'rails_helper'

RSpec.describe "copy_blocks/edit", type: :view do
  before(:each) do
    @copy_block = assign(:copy_block, CopyBlock.create!())
  end

  it "renders the edit copy_block form" do
    render

    assert_select "form[action=?][method=?]", copy_block_path(@copy_block), "post" do
    end
  end
end
