class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :contact, :roles

  def roles
    object.roles
  end

end
