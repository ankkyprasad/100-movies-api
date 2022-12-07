class Movie < ApplicationRecord
  validates :name, presence: true
  validates :release_date, presence: true
  validates :country_of_origin, presence: true
  validates :runtime, presence: true
  has_many :casts
  has_many :actors, through: :casts
  has_many :comments, dependent: :destroy
end
