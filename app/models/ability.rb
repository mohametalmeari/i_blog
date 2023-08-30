# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all # everyone can read posts, comments and likes
    # can :create, [Post, Comment] # everyone can create posts, comments and likes
    can :create, :all
    # can :create, Like # everyone can create posts, comments and likes
    can :destroy, Post, author_id: user.id # everyone can create posts, comments and likes

    # can :manage, Post, user_id: user.id # user with id = (user_id of Friend) can manage Friend
    # can :manage, :all if user.role == "admin" # user with admin = true can manage all database
  end
end
