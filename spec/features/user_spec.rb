require 'spec_helper'

feature 'User browsing the website' do
  background do
    @post = Post.create(title:"salar", content:"sux")
    visit '/'
  end
  
  context "on homepage" do
    it "sees a list of recent posts titles" do
      expect(page).to have_content('Salar')
    end

    it "can click on titles of recent posts and should be on the post show page" do
      click_on "Salar"
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@post.content)
    end
  end

  context "post show page" do
    it "sees title and body of the post" do
      click_on "View All Posts"
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@post.content)
    end
  end
end
