require 'rails_helper'

RSpec.describe "article_authors/index", type: :view do
  before(:each) do
    assign(:article_authors, [
      ArticleAuthor.create!(),
      ArticleAuthor.create!()
    ])
  end

  it "renders a list of article_authors" do
    render
  end
end
