class StorySerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :vacation
  has_one :vacation
end
