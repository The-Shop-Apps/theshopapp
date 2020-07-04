class AddAttributesToShop < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :subscribed, :boolean
    add_column :shops, :account_type, :string
  end
end
