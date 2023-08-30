require 'rails_helper'

RSpec.describe "article_types/show", type: :view do
  before(:each) do
    @article_type = assign(:article_type, ArticleType.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
