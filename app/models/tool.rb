class Tool < ApplicationRecord
  belongs_to :user
  has_many :books

  validates :name, uniqueness: true, presence: true
  validates :description, length: { maximum: 50 }
end
