Spree::Variant.class_eval do
  has_many :packs

  has_many :passive_subscriptions,  -> { without_deleted },
           class_name:  "Spree::Subscription",
           foreign_key: "variant_id",
           dependent:   :destroy
  has_many :subscribers, through: :passive_subscriptions, source: :subscriber

  has_many :available_packs,
          -> { where( 'available_on < ?', DateTime.now ).order(available_on: :desc)},
          inverse_of: :variant,
          class_name: 'Spree::Pack'

  def subscribe
    subscribers << spree_current_user
  end
end