class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :url, :caption, :vacation
  has_one :vacation
end
