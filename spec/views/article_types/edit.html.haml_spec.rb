require 'rails_helper'

RSpec.describe "article_types/edit", type: :view do
  before(:each) do
    @article_type = assign(:article_type, ArticleType.create!())
  end

  it "renders the edit article_type form" do
    render

    assert_select "form[action=?][method=?]", article_type_path(@article_type), "post" do
    end
  end
end
