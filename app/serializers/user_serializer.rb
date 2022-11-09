class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :roles

  def roles
    object.roles
  end

end
