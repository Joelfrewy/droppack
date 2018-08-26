class AbilityDecorator
  include CanCan::Ability
  def initialize(user)
    if user.respond_to?(:has_spree_role?) &&
      if user.has_spree_role?('admin')
        can :manage, Spree::Vendor
      else #if user.has_spree_role?('owner')
        can :manage, Spree::Vendor do |vendor|
          vendor.user == user
        end
      end
    end
  end
end

Spree::Ability.register_ability(AbilityDecorator)