class AddForeignKeyToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :team, foreign_key: true, index: true

  end
end
