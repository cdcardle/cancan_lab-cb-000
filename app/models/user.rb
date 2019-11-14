class User < ApplicationRecord
  has_many :notes
  has_many :viewers
  has_many :readable, through: :viewers, source: :note
end
