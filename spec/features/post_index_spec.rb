require 'rails_helper'

RSpec.feature 'User Post Index Page', type: :feature do
  let!(:user) { create(:user, :with_posts) }

  scenario 'I can see the user\'s profile picture' do
    visit user_posts_path(user)

    expect(page).to have_selector("img[src$='#{user.photo}']")
  end

  scenario 'I can see the user\'s username' do
    visit user_posts_path(user)

    expect(page).to have_content(user.name)
  end

  scenario 'I can see the number of posts the user has written' do
    visit user_posts_path(user)

    expect(page).to have_content("Number of posts: #{user.posts_counter}")
  end

  scenario 'I can see a post\'s title' do
    post = user.posts.first
    visit user_posts_path(user)

    expect(page).to have_content("#{post.title}")
  end

  scenario 'I can see some of the post\'s body' do
    post = user.posts.first
    visit user_posts_path(user)

    expect(page).to have_content(post.text.to_s)
  end

  scenario 'I can see the first comments on a post' do
    post = user.posts.first
    create_list(:comment, 3, post:)
    visit user_posts_path(user)

    post.comments.limit(3).each do |comment|
      expect(page).to have_content(comment.text.to_s)
    end
  end

  scenario 'I can see how many comments a post has' do
    post = user.posts.first
    create_list(:comment, 3, post:)

    visit user_posts_path(user)

    expect(page).to have_content(post.comments.count.to_s)
  end

  scenario 'I can see how many likes a post has' do
    post = user.posts.first
    create_list(:like, 3, post:)

    visit user_posts_path(user)

    expect(page).to have_content(post.likes.count.to_s)
  end

  scenario 'When I click on a post, it redirects me to that post\'s show page' do
    post = user.posts.first
    visit user_posts_path(user)

    click_link "Post #{post.id}"

    expect(current_path).to eq(user_post_path(user, post))
  end

  scenario 'I can see a section for pagination if there are more posts than fit on the view' do
    create_list(:post, 10, user:)
    visit user_posts_path(user)

    expect(page).to have_css('.pagination')
  end
end
