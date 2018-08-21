# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

Spree::User.find_or_create_by(
    encrypted_password: "da5b6f4f82e0328a0a2f6c0321f04142c95573e7311bcfce7e599473de0c429bcb5626ac3857099d0f60a6801c657d46f8594c8706df6c8944033b93c0feceb9",
    password_salt: "Pju5zdVebaXLePgpGaRa",
    email: "gracejones@gmail.com",
    sign_in_count: 0,
    failed_attempts: 0,
    login: "gracejones@gmail.com"
)
@vendor = Spree::Vendor.find_or_create_by(name: 'Crazy Socks', owner_id: 1)
@vendor.avatar.attach(io: File.open('app/assets/images/crazy_socks.jpg'), filename: 'crazy_socks.jpg')
@vendor.save
Spree::Vendor.find_or_create_by(name: 'Comic Box', owner_id: 1)
Spree::Product.all.each_with_index do |product, index|
  if index < 5
    product.update_column(:vendor_id, Spree::Vendor.find_by(name: 'Crazy Socks').id)
  else
    product.update_column(:vendor_id, Spree::Vendor.find_by(name: 'Comic Box').id)
  end
end
