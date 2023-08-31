class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :photo
  has_many :posts
end
