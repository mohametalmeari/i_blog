require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
    test 'users list title' do 
        visit 'users'
        assert_text "List of Users"
    end
    test 'users list' do 
        visit 'users'
        assert_text "Tom"
        assert_text "Lilly"
        assert_text "Lexa"
    end
    # test 'users image' do 
    #     visit 'users'
    #     assert_select 'img[src*=?]', count: 3
    # end
    test 'users posts number' do 
        visit 'users'
        assert_text "Number of posts: 2", count: 1
        assert_text "Number of posts: 1", count: 2
    end
    test 'user link' do 
        visit 'users'
        click_on "Tom"
        assert_text "User's Page"
    end
end