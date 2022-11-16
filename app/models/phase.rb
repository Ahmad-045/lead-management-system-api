class Phase < ApplicationRecord
  belongs_to :lead
  belongs_to :manager, class_name: 'User', foreign_key: 'manager_id', required: true
  has_many :comments, as: :commentable

  enum status: { not_completed: 0, completed: 1 }
  has_and_belongs_to_many :users
end
