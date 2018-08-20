Spree::User.class_eval do
  has_many :vendors, foreign_key: "owner_id"
  has_many :active_subscriptions, -> { where deleted_at: nil },
                                  class_name:  "Spree::Subscription",
                                  foreign_key: "subscriber_id",
                                  dependent:   :destroy
  has_many :subscribed, through: :active_subscriptions, source: :vendor

  def subscribe(vendor)
    subscribed << vendor
  end

  def unsubscribe(vendor)
    subscribed.delete(vendor)
  end

  def subscribed?(vendor)
    subscribed.include?(vendor)
  end
end