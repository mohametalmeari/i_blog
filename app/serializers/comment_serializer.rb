class CommentSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :post
end
