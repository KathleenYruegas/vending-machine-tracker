class Machine < ApplicationRecord
  validates_presence_of :location
  has_many :snacks

  belongs_to :owner

  def avg_snack_price
    snacks.average(:price)
  end
end
