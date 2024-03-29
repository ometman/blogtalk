require 'rails_helper'

RSpec.feature 'Post Show Page', type: :feature do
  let!(:user) { create(:user, :with_posts) }

  scenario 'I can see the post\'s title' do
    post = user.posts.first

    visit user_post_path(user, post)

    expect(page).to have_content(post.title.to_s)
  end

  scenario 'I can see who wrote the post' do
    post = user.posts.first
    create_list(:comment, 3, post:)

    visit user_post_path(user, post)

    expect(page).to have_content(user.name.to_s)
  end

  scenario 'I can see how many comments it has' do
    post = user.posts.first
    create_list(:comment, 3, post:)

    visit user_post_path(user, post)

    expect(page).to have_content(post.comments.count.to_s)
  end

  scenario 'I can see how many likes it has' do
    post = user.posts.first
    create_list(:like, 3, post:)

    visit user_post_path(user, post)

    expect(page).to have_content(post.likes.count.to_s)
  end

  scenario 'I can see the post body' do
    post = user.posts.first
    visit user_post_path(user, post)

    expect(page).to have_content(post.text.to_s)
  end

  scenario 'I can see the username of each commentor' do
    post = user.posts.first
    create_list(:comment, 3, post:)

    visit user_post_path(user, post)

    post.comments.each do |comment|
      expect(page).to have_content(comment.user.name.to_s)
    end
  end

  scenario 'I can see the comment each commentor left' do
    post = user.posts.first
    create_list(:comment, 3, post:)

    visit user_post_path(user, post)

    post.comments.each do |comment|
      expect(page).to have_content(comment.text.to_s)
    end
  end
end
