# frozen_string_literal: true

class Actor < ApplicationRecord
  validates :name, presence: true
  validates :gender, presence: true
  belongs_to :user
  has_many :casts
  has_many :movies, through: :casts
end
