class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :description, :species, :danger_meter, :price, :location, presence: true
  validates :danger_meter, inclusion: { in: 0..5 }
  has_many_attached :photos

  include PgSearch::Model
  # multisearch
  multisearchable against: %i[species name location]

  # single search -- seems like options only work with single search
  pg_search_scope :global_search,
    against: {
      species: 'A',
      location: 'B',
      name: 'C'
    },
    associated_against: {
      user: %i[name location]
    },
    using: {
      tsearch: { prefix: true }
    }
end
