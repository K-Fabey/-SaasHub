class AddNameToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :job_title, :string
    add_column :users, :status, :string
    # add_column :users, :email, :string
    add_column :users, :joining_date, :date
  end
end
