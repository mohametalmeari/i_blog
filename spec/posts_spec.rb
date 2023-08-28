require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
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
    assert_text 'Comments: 6'
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

  scenario 'post title' do
    visit 'users/1/posts/1'
    assert_text 'JS'
    assert_selector 'h3.title'
  end

  scenario 'post writer' do
    visit 'users/1/posts/1'
    assert_text 'by Tom'
  end

  scenario 'post comments number in the post view page' do
    visit 'users/1/posts/1'
    assert_text 'Comments: 6'
  end

  scenario 'post likes number' do
    visit 'users/1/posts/1'
    assert_text 'Likes: 1'
  end

  scenario 'post body' do
    visit 'users/1/posts/1'
    assert_selector 'p.text'
    assert_text 'Details'
  end

  scenario 'post commentors' do
    visit 'users/1/posts/1'
    assert_selector 'h4.commentor'
  end

  scenario 'post comments' do
    visit 'users/1/posts/1'
    assert_text "Tom:\nDynamic scripting language"
    assert_text "Tom:\nClient-side web development"
    assert_text "Tom:\nManipulates HTML/CSS content"
    assert_text "Lilly:\nEvent-driven programming model"
    assert_text "Lilly:\nSupports asynchronous operations"
    assert_text "Lexa:\nExtensive third-party libraries"
  end
end
