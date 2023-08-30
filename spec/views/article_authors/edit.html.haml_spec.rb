require 'rails_helper'

RSpec.describe "article_authors/edit", type: :view do
  before(:each) do
    @article_author = assign(:article_author, ArticleAuthor.create!())
  end

  it "renders the edit article_author form" do
    render

    assert_select "form[action=?][method=?]", article_author_path(@article_author), "post" do
    end
  end
end
