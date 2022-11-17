class User < ApplicationRecord
  rolify
  before_destroy :destroy_leads

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #  :recoverable, :rememberable, :validatable

  devise :database_authenticatable, :registerable, :validatable,
  :jwt_authenticatable,
  jwt_revocation_strategy: JwtDenylist


  has_and_belongs_to_many :phases
  # has_one :project, dependent: :destroy
  has_many :comments
  # has_many :leads, dependent: :destroy

  def destroy_leads
    Lead.where(user_id: self.id)&.destroy_all
  end

end
