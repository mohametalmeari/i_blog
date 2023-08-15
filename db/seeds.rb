# Classes with methods

class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'

  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def update_posts_counter
    self.update(posts_counter: self.posts.count)
  end
end

class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_likes_counter
    self.update(likes_counter: self.likes.count)
  end

  def update_comments_counter
    self.update(comments_counter: self.comments.count)
  end
end

class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
end

class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
end

# Data

user_tom = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
user_lilly = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
user_lexa = User.create(name: 'Lexa', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from USA.')

first_post = Post.create(author: user_tom, title: 'JS', text: 'JS Details')
second_post = Post.create(author: user_tom, title: 'React', text: 'React Details')
third_post = Post.create(author: user_lilly, title: 'Ruby', text: 'Ruby Details')
forth_post = Post.create(author: user_lexa, title: 'RoR', text: 'RoR Details')

Like.create(post: first_post, author: user_lilly)
Like.create(post: third_post, author: user_lexa)

Comment.create(post: first_post, author: user_tom, text: 'Dynamic scripting language' )
Comment.create(post: first_post, author: user_tom, text: 'Client-side web development' )
Comment.create(post: first_post, author: user_tom, text: 'Manipulates HTML/CSS content' )
Comment.create(post: first_post, author: user_lilly, text: 'Event-driven programming model' )
Comment.create(post: first_post, author: user_lilly, text: 'Supports asynchronous operations' )
Comment.create(post: first_post, author: user_lexa, text: 'Extensive third-party libraries' )