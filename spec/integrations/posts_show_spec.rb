require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
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
