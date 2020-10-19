class Customer < ApplicationRecord
  belongs_to :location
  enum status: { disable: 0, enable: 1 }, _prefix: :status
  validates :first_name, :last_name, :phone,  presence: true

end
