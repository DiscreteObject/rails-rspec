require 'spec_helper'

describe Post do
  it "title should be automatically titleized before save" do
    post = Post.create(title: 'blah blah', content: 'wassup')
    expect(post.title).to eq('Blah Blah')
  end

  it "post should be unpublished by default" do
    post = Post.create(title: 'blah blah', content: 'wassup')
    expect(post.is_published).to be_false
  end

  # a slug is an automatically generated url-friendly
  # version of the title
  it "slug should be automatically generated" do
    post = Post.new
    post.title   = "New post!"
    post.content = "A great story"
    post.slug.should be_nil
    post.save

    post.slug.should eq "new-post"
  end
end
