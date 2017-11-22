class Vacation < ApplicationRecord
  belongs_to :user
  has_many :photos, dependant: :destroy
  has_many :stories, dependant: :destroy
end
