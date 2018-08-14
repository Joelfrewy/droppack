class AddOwnerIdToVendor < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_vendors, :owner_id, :int
  end
end
