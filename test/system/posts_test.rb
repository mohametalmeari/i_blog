require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test 'user profile image' do 
    visit 'users/1/posts'
    assert_selector 'img[alt="User Photo"]'
  end
  test 'user name' do 
    visit 'users/1/posts'
    assert_text "Tom"
end
test 'user number of posts' do 
    visit 'users/1/posts'
    assert_text "Number of posts: 2", count: 1
end
test 'Posts title' do 
    visit 'users/1/posts'
    assert_text "JS"
end
test 'Post text' do 
  visit 'users/1/posts'
  assert_text "Details"
end
test 'user profile image' do 
  visit 'users/1/posts'
  assert_selector 'div.comments',maximum:5
end

test 'post comments number' do 
  visit 'users/1/posts'
  assert_text "Comments: 6"
end
test 'view pagination' do 
  visit 'users/1/posts'
  assert_text "Pagination"
end
test 'selescted post link' do 
  visit 'users/1/posts'
  click_on "JS"
  assert_text "Post"
end

end
