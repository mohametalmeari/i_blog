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

# Call methods:
# For User
User.find_by(name: 'Tom').three_most_recent_posts

# For Post
User.find_by(name: 'Tom').update_posts_counter
User.find_by(name: 'Lilly').update_posts_counter
User.find_by(name: 'Lexa').update_posts_counter

# For Like
Post.find_by(title: 'JS').update_likes_counter
Post.find_by(title: 'React').update_likes_counter
Post.find_by(title: 'Ruby').update_likes_counter
Post.find_by(title: 'RoR').update_likes_counter

# For Comment
Post.find_by(title: 'JS').update_comments_counter
Post.find_by(title: 'React').update_comments_counter
Post.find_by(title: 'Ruby').update_comments_counter
Post.find_by(title: 'RoR').update_comments_counter

Post.find_by(title: 'JS').five_most_recent_comments
