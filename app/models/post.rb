class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_likes_counter
    update(likes_counter: likes.count)
  end

  def update_comments_counter
    update(comments_counter: comments.count)
  end
end
