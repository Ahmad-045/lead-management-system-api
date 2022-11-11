class User < ApplicationRecord
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #  :recoverable, :rememberable, :validatable

  devise :database_authenticatable, :registerable, :validatable,
  :jwt_authenticatable,
  jwt_revocation_strategy: JwtDenylist


  has_and_belongs_to_many :phases
  has_one :project, dependent: :destroy

end
