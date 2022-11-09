class PhaseSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :phase_name, :status, :created_at, :manager
end
