class Licence < ApplicationRecord
  ACTIVITIES_STATUS = ["Active", "Inactive"]


  belongs_to :user
  belongs_to :subscriptions

  # validations
  validates :user_activity_status, presence: true, inclusion: { in: ACTIVITIES_STATUS }


end
