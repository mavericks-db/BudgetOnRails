class Group < ApplicationRecord
  belongs_to :user
  has_many :group_budgets, dependent: :destroy
  has_many :budgets, through: :group_budgets
end
