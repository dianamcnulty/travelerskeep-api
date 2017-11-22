class VacationSerializer < ActiveModel::Serializer
  attributes :id, :country, :state, :month, :year, :companions
  has_one :user
end
