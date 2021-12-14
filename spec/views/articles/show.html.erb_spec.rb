require 'rails_helper'

RSpec.describe "articles/show", type: :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      title: "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
