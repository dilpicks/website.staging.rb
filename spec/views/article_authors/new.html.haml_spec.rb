require 'rails_helper'

RSpec.describe "article_authors/new", type: :view do
  before(:each) do
    assign(:article_author, ArticleAuthor.new())
  end

  it "renders new article_author form" do
    render

    assert_select "form[action=?][method=?]", article_authors_path, "post" do
    end
  end
end
