class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :caption, :img, :vacation_id
  has_one :vacation
end
