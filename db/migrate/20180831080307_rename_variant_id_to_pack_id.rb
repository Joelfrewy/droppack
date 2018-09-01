class RenameVariantIdToPackId < ActiveRecord::Migration[5.2]
  def change
    rename_column :spree_line_items, :variant_id, :pack_id
  end
end
