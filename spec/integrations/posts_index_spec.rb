require 'rails_helper'

RSpec.describe 'Posts#Index', type: :feature do
  scenario 'user profile image' do
    visit 'users/1/posts'
    assert_selector 'img[alt="User Photo"]'
  end
  scenario 'user name' do
    visit 'users/1/posts'
    assert_text 'Tom'
  end
  scenario 'user number of posts' do
    visit 'users/1/posts'
    assert_text 'Number of posts: 2', count: 1
  end
  scenario 'a post title' do
    visit 'users/1/posts'
    assert_text 'JS'
    assert_selector 'h3.title'
  end
  scenario 'a post text' do
    visit 'users/1/posts'
    assert_text 'Details'
  end
  scenario 'first 5 comments' do
    visit 'users/1/posts'
    assert_selector 'div.comments', maximum: 5
  end

  scenario 'post comments number' do
    visit 'users/1/posts'
    assert_text 'Comments:'
  end

  scenario 'post likes number' do
    visit 'users/1/posts'
    assert_text 'Likes:'
  end

  scenario 'view pagination' do
    visit 'users/1/posts'
    assert_text 'Pagination'
  end

  scenario 'selescted post link' do
    visit 'users/1/posts'
    click_on 'JS'
    assert_text 'Post'
  end
end
