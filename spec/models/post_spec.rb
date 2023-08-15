require 'rails_helper'

RSpec.describe Post, type: :model do 
  
  it 'title should be present' do
    user_tom = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    post = Post.new(author: user_tom, title: nil, text: 'JS Details')
    expect(post).to_not be_valid
  end
end
