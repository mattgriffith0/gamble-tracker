class Game < ApplicationRecord
  belongs_to :user
  belongs_to :casino
  belongs_to :trip, optional: true
  has_one :currency
  has_one :odd

  validates :buy_in, numericality: { only_integer: true, greater_than: 0}
  validates :cash_out, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :currency_id, presence: true
  validates :odds_id, presence: true
end
