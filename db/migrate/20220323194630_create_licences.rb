class CreateLicences < ActiveRecord::Migration[6.1]
  def change
    create_table :licences do |t|
      t.string :user_activity_status
      t.date :licence_date

      t.timestamps
    end
  end
end
