class TodoList < ApplicationRecord
  has_many :items
  validates :created_by, presence: true
end