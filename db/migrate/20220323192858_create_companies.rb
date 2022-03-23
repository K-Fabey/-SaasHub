class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :siren
      t.string :address
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
