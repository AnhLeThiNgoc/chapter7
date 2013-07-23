require 'spec_helper'

describe "micro_posts/new" do
  before(:each) do
    assign(:micro_post, stub_model(MicroPost,
      :content => "MyString"
    ).as_new_record)
  end

  it "renders new micro_post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", micro_posts_path, "post" do
      assert_select "input#micro_post_content[name=?]", "micro_post[content]"
    end
  end
end
