require 'rails_helper'

RSpec.describe "CreatingBlogPosts", type: :system do
  before do
    driven_by(:rack_test)
  end

  pending "add some scenarios (or delete) #{__FILE__}"
  it 'saves and displays a new blog post' do
    visit '/blog_posts/new'
    fill_in 'Title', with: 'My first blog post'
    fill_in 'Body', with: 'This is my first blog post'
    click_button 'Create Blog post'
    expect(page).to have_content('My first blog post')
    expect(page).to have_content('This is my first blog post')

    blog_post = BlogPost.order("id").last
    expect(blog_post.title).to eq('My first blog post')
    expect(blog_post.body).to eq('This is my first blog post')
  end
end
