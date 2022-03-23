class Subscription < ApplicationRecord
  has_many :licences, dependent: :destroy
  has_many :users, through: :licences, dependent: :destroy
  belongs_to :Company

  belongs_to :technical_onwer, class_name: "User"
  belongs_to :functional_onwer, class_name: "User"


  # validations

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :subscription_date, presence: true
  validates :renewal_date, presence: true
  validates :link, presence: true
  validates :payment_method, presence: true
  validates :purchased_licences, presence: true


end
