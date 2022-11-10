class Role < ApplicationRecord
  ROLES = ['guest', 'engineer', 'bd', 'manager', 'admin']

  has_and_belongs_to_many :users, :join_table => :users_roles

  belongs_to :resource,
             :polymorphic => true,
             :optional => true


  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify

  validate :test_valid_input_role

  def test_valid_input_role
    errors.add(:base, 'Invalid Role') unless ROLES.include? self.name
  end

end
