require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'title should be present' do
    user_tom = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    post = Post.new(author: user_tom, title: nil, text: 'JS Details')
    expect(post).to_not be_valid
  end

  it 'title should be present' do
    user_tom = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    post = Post.new(author: user_tom, title: 'a' * 251, text: 'JS Details')
    expect(post).to_not be_valid
  end

  it 'CommentsCounter must be an integer greater than or equal to zero' do
    user_tom = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    post = Post.new(author: user_tom, title: 'JS', text: 'JS Details')
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'LikesCounter must be an integer greater than or equal to zero' do
    user_tom = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    post = Post.new(author: user_tom, title: 'JS', text: 'JS Details')
    post.comments_counter = 1
    post.likes_counter = -1
    expect(post).to_not be_valid
  end
end
