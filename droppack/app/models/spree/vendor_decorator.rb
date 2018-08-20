Spree::Vendor.class_eval do
  before_create :set_slug
  #before_action :get_vendor, only: [:show, :edit, :destroy]
  has_one_attached :avatar, dependent: :destroy
  belongs_to :user, foreign_key: "owner_id"
  has_many :passive_subscriptions,  -> { where deleted_at: nil },
                                    class_name:  "Spree::Subscription",
                                   foreign_key: "vendor_id",
                                   dependent:   :destroy
  has_many :subscribers, through: :passive_subscriptions, source: :subscriber

  def to_param
    self.slug
  end

  private

  def set_slug
    self.slug = [name.parameterize].join("-")
  end

  def get_vendor
    @vendor = Vendor.find_by slug: params[:slug]
  end
end