class Location < ApplicationRecord
    has_many :customers
    enum status: { draft: 0, pending: 1, published: 2, canceled: 3 }, _prefix: :status
    validates :name, presence: true

end
