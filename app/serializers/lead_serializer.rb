class LeadSerializer < ActiveModel::Serializer
  attributes :id, :project_name, :client_name, :client_address, :client_address, :client_email, :client_contact, :platform_used, :test_type, :user, :created_at, :phasesCount

  def phasesCount
    object.phases.count
  end

end
