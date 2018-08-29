class CreateSpreePacks < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_packs do |t|
      t.datetime "deleted_at"
      t.string "name", default: "", null: false
      t.text "description"
      t.integer "variant_id"
      t.datetime "available_on"
      t.datetime "discontinue_on"
      t.timestamps
    end
    add_foreign_key :spree_packs, :spree_variants, column: :variant_id, primary_key: :id, index: true
    add_index :spree_packs, :available_on
    add_index :spree_packs, :discontinue_on
    add_index :spree_packs, :deleted_at
  end
end