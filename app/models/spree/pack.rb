class Spree::Pack < ApplicationRecord
  acts_as_paranoid
  belongs_to :variant, class_name: "Spree::Variant"
end
