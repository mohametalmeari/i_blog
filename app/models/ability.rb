class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    can :create, :all
    can :destroy, Post, author_id: user.id
    can :destroy, Comment, author_id: user.id
    can :manage, :all if user.role == 'admin'
  end
end
