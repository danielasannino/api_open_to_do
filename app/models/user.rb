class User < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :items, through: :lists

  validates_presence_of :password, on: :create

end
