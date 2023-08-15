require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'name should be present' do
    user = User.new(name: nil, photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    expect(user).to_not be_valid
  end
  
  it 'PostsCounter must be an integer greater than or equal to zero' do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    user.posts_counter = -1
    expect(user).to_not be_valid
  end
end
