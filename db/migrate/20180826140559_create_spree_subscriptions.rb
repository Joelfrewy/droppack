class CreateSpreeSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_subscriptions do |t|
      t.datetime :deleted_at
      t.integer :subscriber_id
      t.integer :variant_id
      t.timestamps
    end
    add_foreign_key :spree_subscriptions, :spree_users, column: :subscriber_id, primary_key: :id, index: true
    add_foreign_key :spree_subscriptions, :spree_variants, column: :variant_id, primary_key: :id, index: true
    add_index :spree_subscriptions, [:subscriber_id, :variant_id], unique: true, where: "deleted_at IS NULL"
    add_index :spree_subscriptions, :deleted_at
  end
end