class Vacation < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :stories
end
