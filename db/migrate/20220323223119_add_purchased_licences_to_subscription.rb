class AddPurchasedLicencesToSubscription < ActiveRecord::Migration[6.1]
  def change
    add_column :subscriptions, :purchased_licences, :integer
  end
end
