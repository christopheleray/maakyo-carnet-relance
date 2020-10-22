class Location < ApplicationRecord
    has_many :customers, dependent: :destroy
    belongs_to :user
    enum status: { draft: 0, pending: 1, published: 2, canceled: 3 }, _prefix: :status
    validates :name, :phone,  presence: true
end
