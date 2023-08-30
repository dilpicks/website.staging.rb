require 'rails_helper'

RSpec.describe "copy_blocks/index", type: :view do
  before(:each) do
    assign(:copy_blocks, [
      CopyBlock.create!(),
      CopyBlock.create!()
    ])
  end

  it "renders a list of copy_blocks" do
    render
  end
end
