class AddForeignKeys < ActiveRecord::Migration[6.1]
  def change

    # adding foreign keys to Teams
    add_reference :teams, :team_leader, foreign_key: { to_table: :users }, index: true
    add_reference :teams, :company, foreign_key: true, index: true


    # adding foreign keys to Subscriptions
    add_reference :subscriptions, :company, foreign_key: true, index: true
    add_reference :subscriptions, :technical_owner, foreign_key: { to_table: :users }, index: true
    add_reference :subscriptions, :functional_owner, foreign_key: { to_table: :users }, index: true

    # adding foreign keys to Licences
    add_reference :licences, :user, foreign_key: true, index: true
    add_reference :licences, :subscription, foreign_key: true, index: true


  end
end
