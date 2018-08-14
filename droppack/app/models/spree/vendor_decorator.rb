Spree::Vendor.class_eval do
  before_create :set_slug
  #before_action :get_vendor, only: [:show, :edit, :destroy]
  has_one_attached :image, dependent: :destroy
  belongs_to :user, foreign_key: "owner_id"
  
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