class Team < ApplicationRecord
  belongs_to :company
  belongs_to :team_leader, class_name: "User"

  has_many :users # no destroy dependencies between teams and users. When we delete a team, we shouldn't delete the users as well


  # Validations

  validates :name, presence: true, uniqueness: { scope: :company,
    message: "two teams can not have the same name" }

end
