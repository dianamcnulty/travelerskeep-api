class VacationSerializer < ActiveModel::Serializer
  attributes :id, :country, :state, :month, :year, :companions
  has_one :user
  # has_many :photos
  has_many :stories
end
