Spree::Variant.class_eval do
  has_many :packs

  has_many :passive_subscriptions,  -> { without_deleted },
           class_name:  "Spree::Subscription",
           foreign_key: "variant_id",
           dependent:   :destroy
  has_many :subscribers, through: :passive_subscriptions, source: :subscriber
end