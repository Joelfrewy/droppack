# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

Spree::Vendor.find_or_create_by(name: 'Crazy Socks', owner_id: 2)
Spree::Vendor.find_or_create_by(name: 'Comic Box', owner_id: 2)
Spree::Product.all.each_with_index do |product, index|
    if index < 5
        product.update_column(:vendor_id, Spree::Vendor.find_by(name: 'Crazy Socks').id)
    else
        product.update_column(:vendor_id, Spree::Vendor.find_by(name: 'Comic Box').id)
    end
end