require 'rails_helper'

RSpec.feature 'User Show Page', type: :feature do
  let!(:user) { create(:user) }

  scenario 'I can see the user\'s profile picture' do
    visit user_path(user)
    expect(page).to have_selector("img[src$='#{user.photo}']")
  end

  scenario 'I can see the user\'s username' do
    visit user_path(user)
    expect(page).to have_content(user.name)
  end

  scenario 'I can see the number of posts the user has written' do
    visit user_path(user)
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
  end

  scenario 'I can see the user\'s bio' do
    visit user_path(user)
    expect(page).to have_content(user.bio.to_s)
  end

  scenario "I can see the user's first 3 posts" do
    # Create 3 posts for the user
    create_list(:post, 3, user:)

    # Visit the user's show page
    visit user_path(user)

    # Check if each post title is displayed on the page
    user.posts.limit(3).each do |post|
      expect(page).to have_content(post.id)
    end
  end

  scenario 'I can see a button that lets me view all of a user\'s posts' do
    visit user_path(user)
    expect(page).to have_link('Show more')
  end

  scenario "When I click a user's post, it redirects me to that post's show page" do
    post = create(:post, user:)
    visit user_path(user)

    click_link "Post #{post.id}"

    expect(current_path).to eq(user_post_path(user, post))
  end

  scenario 'When I click to see all posts, it redirects me to the user\'s post\'s index page' do
    create(:post, user:)
    visit user_path(user)

    click_link 'Show more'
    expect(current_path).to eq(user_posts_path(user))
  end
end
