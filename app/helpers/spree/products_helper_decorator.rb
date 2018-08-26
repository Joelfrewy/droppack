Spree::ProductsHelper.class_eval do
  def vendor_name(product)
      vendorname = product.vendor.name
    end
end