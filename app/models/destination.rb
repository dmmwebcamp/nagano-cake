class Destination < ApplicationRecord
    
 VALID_POSTALCODE_REGEX = /\A\d{7}$\z/

  belongs_to :customer

  def destination_postal_code_and_address_and_name
    "〒#{self.postal_code}  #{self.address}  #{self.recipient}"
  end

  validates :postal_code, presence: true, format: { with: VALID_POSTALCODE_REGEX }
  validates :address, presence: true, length: { in: 1..48 }
  validates :recipient, presence: true, length: { in: 1..32 }
    
end
