class AddSlugToVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_vendors, :slug, :string
  end
end
