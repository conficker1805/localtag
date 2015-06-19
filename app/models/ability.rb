class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new

    alias_action :create, :read, :update, :destroy, :to => :crud

    can :access, :rails_admin   # grant access to rails_admin
    can :dashboard
    can :manage, :all

    case user.role
      when 'admin'
        can :access, :rails_admin 
        can :dashboard   
        can :manage, :all
      when 'author'
        can :edit, Blog, {user_id: user.id}
    end
  end
end