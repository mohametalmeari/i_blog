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
