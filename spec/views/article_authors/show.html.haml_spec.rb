require 'rails_helper'

RSpec.describe "article_authors/show", type: :view do
  before(:each) do
    @article_author = assign(:article_author, ArticleAuthor.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
