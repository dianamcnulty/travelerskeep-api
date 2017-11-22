class Vacation < ApplicationRecord
  belongs_to :user
  has_many :photos, :stories, dependant: :destroy
end
