class Customer < ApplicationRecord
  belongs_to :location
  enum status: { disable: 0, enable: 1 }, _prefix: :status
  validates :first_name, :last_name,  presence: true
  validates :phone, :presence => {:notice => 'Merci de rentrer votre numéro de téléphone à 10 chiffres'},
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 10 }

end
