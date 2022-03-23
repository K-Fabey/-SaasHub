class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  STATUS = ["Active", "Inactive"]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :logo
  has_many :licences, dependent: :destroy
  has_many :subscriptions, through: :licences # no destroy dependencies between subscriptions and users. When we delete a user, we shouldn't delete the subscription as well

  belongs_to :team

  # validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :job_title, presence: true
  validates :email, presence: true, uniqueness: true
  validates :joining_date, presence: true
  validates :status, presence: true, inclusion: { in: STATUS }


end
