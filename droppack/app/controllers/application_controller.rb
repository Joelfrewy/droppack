class ApplicationController < ActionController::Base
	include Spree::Core::ControllerHelpers::Order
	  include Spree::Core::ControllerHelpers::Auth
	  include Spree::Core::ControllerHelpers::Store
	  include Spree::Core::ControllerHelpers::Common
	  helper Spree::BaseHelper
end
