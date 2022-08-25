class Tool < ApplicationRecord
  belongs_to :user
  has_many :books
  has_one_attached :photo

  validates :name, uniqueness: true, presence: true
  validates :description, length: { maximum: 50 }
  include PgSearch::Model
  pg_search_scope :name_search,
  against: [ :name],
  using: {
    tsearch: { prefix: true }
  }
  pg_search_scope :location_search,
  against: [ :location],
  using: {
    tsearch: { prefix: true }
  }
end
