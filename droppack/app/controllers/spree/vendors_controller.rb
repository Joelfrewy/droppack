class Spree::VendorsController < ApplicationController
    before_action :load_vendor, only: :show

    respond_to :html

    def index
      '''@searcher = build_searcher(params.merge(include_images: true))
      @products = @searcher.retrieve_products
      @products = @products.includes(:possible_promotions) if @products.respond_to?(:includes)
      @taxonomies = Spree::Taxonomy.includes(root: :children)'''
    end

    def show
      '''@variants = @product.variants_including_master.
          spree_base_scopes.
          active(current_currency).
          includes([:option_values, :images])
      @product_properties = @product.product_properties.includes(:property)'''
    end

    def vendor_image(vendor)
      vendor.image
    end

    private

    def accurate_title
      '''if @vendor
        @vendor.meta_title.blank? ? @vendor.name : @vendor.meta_title
      else
        super
      end'''
      @vendor.name
    end

    def load_vendor
      @vendors = if try_spree_current_user.try(:has_spree_role?, 'admin')
                    Spree::Vendor.with_deleted
                  else
                    Spree::Vendor
                  end
      #@vendor = @vendors.friendly.distinct(false).find(params[:id])
      @vendor = @vendors.distinct(false).find(params[:id])
    end

    def redirect_if_legacy_path
      # If an old id or a numeric id was used to find the record,
      # we should do a 301 redirect that uses the current friendly id.
      if params[:id] != @vendor.friendly_id
        params[:id] = @vendor.friendly_id
        params.permit!
        redirect_to url_for(params), status: :moved_permanently
      end
    end
  end