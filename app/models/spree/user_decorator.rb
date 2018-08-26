Spree::User.class_eval do
  has_many :vendors, foreign_key: "owner_id"
  has_many :active_subscriptions, -> { without_deleted },
                                  class_name:  "Spree::Subscription",
                                  foreign_key: "subscriber_id",
                                  dependent:   :destroy
  has_many :subscribed, through: :active_subscriptions, source: :variant

  def subscribe(variant)
    subscribed << variant
  end

  def unsubscribe(variant)
    subscribed.destroy(variant)
  end

  def subscribed?(variant)
    subscribed.include?(variant)
  end
end