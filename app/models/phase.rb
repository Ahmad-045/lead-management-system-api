class Phase < ApplicationRecord
  belongs_to :lead
  belongs_to :manager, class_name: 'User', foreign_key: 'manager_id', required: true

  enum status: { not_completed: 0, completed: 1 }
end
