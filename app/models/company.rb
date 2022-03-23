class Company < ApplicationRecord
  has_many :teams, dependent: :destroy
  has_many :users, through: :teams, dependent: :destroy

  has_many :subscriptions, dependent: :destroy

  # validations
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :siren, presence: true, uniqueness: true

end
