# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

unless Spree::User.exists?(email: "gracejones@gmail.com")
  Spree::User.create!(email: "gracejones@gmail.com", password: "gracejones", password_confirmation: "gracejones")
end
unless Spree::User.exists?(email: "tomstane@gmail.com")
  Spree::User.create!(email: "tomstane@gmail.com", password: "tomstane", password_confirmation: "tomstane")
end
unless Spree::User.exists?(email: "danieltarley@gmail.com")
  Spree::User.create!(email: "danieltarley@gmail.com", password: "danieltarley", password_confirmation: "danieltarley")
end
unless Spree::User.exists?(email: "jeffsapley@gmail.com")
  Spree::User.create!(email: "jeffsapley@gmail.com", password: "jeffsapley", password_confirmation: "jeffsapley")
end
unless Spree::User.exists?(email: "benback@gmail.com")
  Spree::User.create!(email: "benback@gmail.com", password: "benback", password_confirmation: "benback")
end

Spree::Vendor.find_or_create_by(name: 'Crazy Socks', owner_id: Spree::User.find_by(email: "gracejones@gmail.com").id)
Spree::Vendor.find_or_create_by(name: 'Comic Box', owner_id: Spree::User.find_by(email: "tomstane@gmail.com").id)

Spree::Product.all.each_with_index do |product, index|
  if index < 5
    product.update_column(:vendor_id, Spree::Vendor.find_by(name: 'Crazy Socks').id)
  else
    product.update_column(:vendor_id, Spree::Vendor.find_by(name: 'Comic Box').id)
  end
end

Spree::Subscription.find_or_create_by(subscriber_id: Spree::User.find_by(email: "danieltarley@gmail.com").id,
                                      variant_id: Spree::Variant.find_by(product_id: Spree::Product.find_by(name: "Ruby on Rails Tote").id).id)
Spree::Subscription.find_or_create_by(subscriber_id: Spree::User.find_by(email: "danieltarley@gmail.com").id,
                                      variant_id: Spree::Variant.find_by(product_id: Spree::Product.find_by(name: "Ruby on Rails Bag").id).id)
Spree::Subscription.find_or_create_by(subscriber_id: Spree::User.find_by(email: "jeffsapley@gmail.com").id,
                                      variant_id: Spree::Variant.find_by(product_id: Spree::Product.find_by(name: "Ruby on Rails Tote").id).id)

Spree::Pack.find_or_create_by(variant_id: Spree::Variant.find_by(product_id: Spree::Product.find_by(name: "Ruby on Rails Tote").id).id,
                              available_on: DateTime.new(2018,9,14,8) )