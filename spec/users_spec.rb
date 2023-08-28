require 'rails_helper'

RSpec.describe 'User', type: :feature do
  scenario 'users list title' do
    visit 'users'
    assert_text 'List of Users'
  end
  scenario 'users list' do
    visit 'users'
    assert_text 'Tom'
    assert_text 'Lilly'
    assert_text 'Lexa'
  end
  scenario 'users image' do
    visit 'users'
    assert_selector 'img[alt="User Photo"]', count: 3
  end
  scenario 'users posts number' do
    visit 'users'
    assert_text 'Number of posts: 2', count: 1
    assert_text 'Number of posts: 1', count: 2
  end
  scenario 'user link' do
    visit 'users'
    click_on 'Tom'
    assert_text "User's Page"
    assert_text 'Tom'
  end
  scenario 'user profile image' do
    visit 'users/1'
    assert_selector 'img[alt="User Photo"]'
  end
  scenario 'user name' do
    visit 'users/1'
    assert_text 'Tom'
  end
  scenario 'user number of posts' do
    visit 'users/1'
    assert_text 'Number of posts: 2', count: 1
  end
  scenario 'user bio' do
    visit 'users/1'
    assert_text 'Bio'
  end
  scenario 'user first 3 posts' do
    visit 'users/1'
    assert_selector 'div.post-card', maximum: 3
  end
  scenario 'view all posts button' do
    visit 'users/1'
    assert_text 'See all posts'
  end
  scenario 'user post link' do
    visit 'users/1'
    click_on 'React'
    assert_text 'Post'
  end
  scenario 'see all post link' do
    visit 'users/1'
    click_on 'See all posts'
    assert_text 'List of Posts'
  end
end
