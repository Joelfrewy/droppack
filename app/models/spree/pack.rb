module Spree
  class Pack < Spree::Base
  acts_as_paranoid
  belongs_to :variant, class_name: "Spree::Variant"
  end
end
