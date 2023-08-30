require 'rails_helper'

RSpec.describe "copy_blocks/show", type: :view do
  before(:each) do
    @copy_block = assign(:copy_block, CopyBlock.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
