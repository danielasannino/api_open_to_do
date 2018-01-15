class User < ApplicationRecord
  has_many :lists
  has_many :items, through: :lists

  validates_presence_of :password, on: :create

end
