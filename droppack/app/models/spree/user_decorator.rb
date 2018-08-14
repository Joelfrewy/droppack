Spree::User.class_eval do
  has_many :vendors, foreign_key: "owner_id"
end