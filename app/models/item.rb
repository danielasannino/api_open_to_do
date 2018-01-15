class Item < ApplicationRecord
  belongs_to :list

  validates :description, length: { minimum: 5 }, presence: true
end
