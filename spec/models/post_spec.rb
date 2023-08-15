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

  it 'return last five comments' do
    user_jack = User.create(name: 'Jack', photo: 'https://', bio: 'Teacher from USA.')
    user_jon = User.create(name: 'Jon', photo: 'https://', bio: 'Teacher from USA.')
    user_lexa = User.create(name: 'Lexa', photo: 'https://', bio: 'Teacher from USA.')

    first_post = Post.create(author: user_jack, title: 'JS', text: 'JS Details')

    Comment.create(post: first_post, author: user_jack, text: 'Good post')
    Comment.create(post: first_post, author: user_jon, text: 'Nice')
    Comment.create(post: first_post, author: user_lexa, text: 'Useful')

    expect(first_post.five_most_recent_comments.length).to be 3
  end

  it 'updates comments counter' do
    user_jack = User.create(name: 'Jack', photo: 'https://', bio: 'Teacher from USA.')
    user_jon = User.create(name: 'Jon', photo: 'https://', bio: 'Teacher from USA.')
    user_lexa = User.create(name: 'Lexa', photo: 'https://', bio: 'Teacher from USA.')

    first_post = Post.create(author: user_jack, title: 'JS', text: 'JS Details')

    Comment.create(post: first_post, author: user_jack, text: 'Good post')
    Comment.create(post: first_post, author: user_jon, text: 'Nice')
    Comment.create(post: first_post, author: user_lexa, text: 'Useful')

    first_post.update_comments_counter
    expect(first_post.comments_counter).to be 3
  end

  it 'updates likes counter' do
    user_jack = User.create(name: 'Jack', photo: 'https://', bio: 'Teacher from USA.')
    user_jon = User.create(name: 'Jon', photo: 'https://', bio: 'Teacher from USA.')
    user_lexa = User.create(name: 'Lexa', photo: 'https://', bio: 'Teacher from USA.')

    first_post = Post.create(author: user_jack, title: 'JS', text: 'JS Details')

    Like.create(post: first_post, author: user_lexa)
    Like.create(post: first_post, author: user_jon)

    first_post.update_likes_counter
    expect(first_post.likes_counter).to be 2
  end
end
