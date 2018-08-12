Spree::Vendor.class_eval do
  before_create :set_slug
  before_action :get_vendor, only: [:show, :edit, :destroy]
  has_one_attached :image, dependent: :destroy

  def to_param
    vendor.slug
  end

  private

  def set_slug
    [name.parameterize].join("-")
  end

  def get_vendor
    @vendor = Vendor.find_by slug: params[:slug]
  end
end