class Lead < ApplicationRecord
  belongs_to :user
  has_many :phases

  enum test_type: { not_assigned: 0, test_project: 1, interview: 2 }
end
