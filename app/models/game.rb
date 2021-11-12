class Game < ApplicationRecord
  belongs_to :user
  belongs_to :trip, optional: true

  validates :buy_in, numericality: { only_integer: true, greater_than: 0}
  validates :cash_out, numericality: { only_integer: true, greater_than_or_equal_to: 0}
end
