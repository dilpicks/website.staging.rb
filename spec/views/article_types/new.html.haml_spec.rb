require 'rails_helper'

RSpec.describe "article_types/new", type: :view do
  before(:each) do
    assign(:article_type, ArticleType.new())
  end

  it "renders new article_type form" do
    render

    assert_select "form[action=?][method=?]", article_types_path, "post" do
    end
  end
end
