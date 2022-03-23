class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :provider
      t.float :price
      t.string :periodicity
      t.date :subscription_date
      t.date :renewal_date
      t.string :link
      t.string :payment_method


      t.timestamps
    end
  end
