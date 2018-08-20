class Spree::Subscription < ApplicationRecord
  acts_as_paranoid
  belongs_to :subscriber, class_name: "Spree::User"
  belongs_to :vendor, class_name: "Spree::Vendor"

  def deactivate
    self.deleted_at = DateTime.now
  end
end
