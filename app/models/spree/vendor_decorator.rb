module Spree
  Vendor.class_eval do
    extend FriendlyId
    friendly_id :slug_candidates, use: :history
    #before_action :get_vendor, only: [:show, :edit, :destroy]
    has_one_attached :avatar, dependent: :destroy
    belongs_to :user, foreign_key: "owner_id"

    after_destroy :punch_slug
    after_restore :update_slug_history

    before_validation :normalize_slug, on: :update

    validates :slug, presence: true, uniqueness: { allow_blank: false }

    def normalize_slug
      self.slug = normalize_friendly_id(slug)
    end

    def punch_slug
      # punch slug with date prefix to allow reuse of original
      update_column :slug, "#{Time.current.to_i}_#{slug}"[0..254] unless frozen?
    end

    def update_slug_history
      save!
    end

    # Try building a slug based on the following fields in increasing order of specificity.
    def slug_candidates
      [
          :name,
          [:name, :id]
      ]
    end

    private

    def get_vendor
      @vendor = Vendor.find_by slug: params[:slug]
    end
  end
end