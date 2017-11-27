class Vacation < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :stories, dependent: :destroy
end
