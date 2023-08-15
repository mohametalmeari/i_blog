require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'name should be present' do
    user = User.new(name: nil, photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    expect(user).to_not be_valid
  end
end
