# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :destroy, Post, user_id: user.id if user.persisted?
      can :destroy, Comment, user_id: user.id if user.persisted?
    end
  end
end
