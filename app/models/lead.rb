class Lead < ApplicationRecord
  belongs_to :user
  has_many :phases, dependent: :destroy
  has_many :comments, as: :commentable

  enum test_type: { not_assigned: 0, test_project: 1, interview: 2 }
end
