# require 'application_system_test_case'

# class PostsTest < ApplicationSystemTestCase
#   test 'user profile image' do
#     visit 'users/1/posts'
#     assert_selector 'img[alt="User Photo"]'
#   end
#   test 'user name' do
#     visit 'users/1/posts'
#     assert_text 'Tom'
#   end
#   test 'user number of posts' do
#     visit 'users/1/posts'
#     assert_text 'Number of posts: 2', count: 1
#   end
#   test 'a post title' do
#     visit 'users/1/posts'
#     assert_text 'JS'
#     assert_selector 'h3.title'
#   end
#   test 'a post text' do
#     visit 'users/1/posts'
#     assert_text 'Details'
#   end
#   test 'first 5 comments' do
#     visit 'users/1/posts'
#     assert_selector 'div.comments', maximum: 5
#   end

#   test 'post comments number' do
#     visit 'users/1/posts'
#     assert_text 'Comments: 6'
#   end

#   test 'view pagination' do
#     visit 'users/1/posts'
#     assert_text 'Pagination'
#   end

#   test 'selescted post link' do
#     visit 'users/1/posts'
#     click_on 'JS'
#     assert_text 'Post'
#   end

#   test 'post title' do
#     visit 'users/1/posts/1'
#     assert_text 'JS'
#     assert_selector 'h3.title'
#   end

#   test 'post writer' do
#     visit 'users/1/posts/1'
#     assert_text 'by Tom'
#   end

#   test 'post comments number in the post view page' do
#     visit 'users/1/posts/1'
#     assert_text 'Comments: 6'
#   end

#   test 'post likes number' do
#     visit 'users/1/posts/1'
#     assert_text 'Likes: 1'
#   end

#   test 'post body' do
#     visit 'users/1/posts/1'
#     assert_selector 'p.text'
#     assert_text 'Details'
#   end

#   test 'post commentors' do
#     visit 'users/1/posts/1'
#     assert_selector 'h4.commentor'
#   end

#   test 'post comments' do
#     visit 'users/1/posts/1'
#     assert_text "Tom:\nDynamic scripting language"
#     assert_text "Tom:\nClient-side web development"
#     assert_text "Tom:\nManipulates HTML/CSS content"
#     assert_text "Lilly:\nEvent-driven programming model"
#     assert_text "Lilly:\nSupports asynchronous operations"
#     assert_text "Lexa:\nExtensive third-party libraries"
#   end
# end
