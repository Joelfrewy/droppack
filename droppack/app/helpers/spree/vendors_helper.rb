module Spree
	module VendorsHelper
		def cache_key_for_vendor(vendor = @vendor)
	      (common_vendor_cache_keys + [vendor.cache_key_with_version]).compact.join('/')
	    end

	    def common_vendor_cache_keys
	      [I18n.locale, current_currency]
	    end
	end
end