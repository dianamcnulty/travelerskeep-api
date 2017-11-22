# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :vacations
  has_many :photos, through: :vacations
  has_many :stories, through: :vacations
end
