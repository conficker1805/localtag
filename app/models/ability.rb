class Ability
  include CanCan::Ability
  def initialize(admin)
    admin ||= Admin.new

    alias_action :create, :read, :update, :destroy, :to => :crud

    can :access, :rails_admin   # grant access to rails_admin
    can :dashboard

    case admin.permission
      when 'admin'
        can :access, :rails_admin 
        can :dashboard   
        can :manage, :all
      when 'author'
        can :crud, Blog
    end
  end
end