class Tool < ApplicationRecord
  belongs_to :user
  has_many :books

  validates :name, uniqueness: true, presence: true
end
