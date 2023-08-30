require 'rails_helper'

RSpec.describe "article_types/index", type: :view do
  before(:each) do
    assign(:article_types, [
      ArticleType.create!(),
      ArticleType.create!()
    ])
  end

  it "renders a list of article_types" do
    render
  end
end
