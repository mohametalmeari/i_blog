require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  test 'users list title' do
    visit 'users'
    assert_text 'List of Users'
  end
  test 'users list' do
    visit 'users'
    assert_text 'Tom'
    assert_text 'Lilly'
    assert_text 'Lexa'
  end
  test 'users image' do
    visit 'users'
    assert_selector 'img[alt="User Photo"]', count: 3
  end
  test 'users posts number' do
    visit 'users'
    assert_text 'Number of posts: 2', count: 1
    assert_text 'Number of posts: 1', count: 2
  end
  test 'user link' do
    visit 'users'
    click_on 'Tom'
    assert_text "User's Page"
    assert_text 'Tom'
  end
  test 'user profile image' do
    visit 'users/1'
    assert_selector 'img[alt="User Photo"]'
  end
  test 'user name' do
    visit 'users/1'
    assert_text 'Tom'
  end
  test 'user number of posts' do
    visit 'users/1'
    assert_text 'Number of posts: 2', count: 1
  end
  test 'user bio' do
    visit 'users/1'
    assert_text 'Bio'
  end
  test 'user first 3 posts' do
    visit 'users/1'
    assert_selector 'div.post-card', maximum: 3
  end
  test 'view all posts button' do
    visit 'users/1'
    assert_text 'See all posts'
  end
  test 'user post link' do
    visit 'users/1'
    click_on 'React'
    assert_text 'Post'
  end
  test 'see all post link' do
    visit 'users/1'
    click_on 'See all posts'
    assert_text 'List of Posts'
  end
end
