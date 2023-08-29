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
end
