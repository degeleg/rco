class Ability
  include CanCan::Ability

  def initialize(admin)

    admin ||= Admin.new

    if admin.has_role? :moderator
        can :manage, :pages
    end
    
    if admin.has_role? :admin
        can :manage, :all
    end

    if admin.has_role? :developer
        can :manage, :all
    end

    if admin.has_role? :designer
        can :manage, :all
    end
    
  end
end
