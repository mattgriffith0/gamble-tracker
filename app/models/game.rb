class Game < ApplicationRecord
  belongs_to :user
  belongs_to :trip, optional: true
end
