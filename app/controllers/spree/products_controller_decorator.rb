Spree::ProductsController.class_eval do

  def vendor_name(product)
    vendorname = product.vendor.name
  end

  def show
    @variants = @product.variants_including_master.
        spree_base_scopes.
        active(current_currency).
        includes([:option_values, :images])
    @available_packs = @variants.first.available_packs
    @product_properties = @product.product_properties.includes(:property)
    @taxon = params[:taxon_id].present? ? Spree::Taxon.find(params[:taxon_id]) : @product.taxons.first
    redirect_if_legacy_path
  end
end