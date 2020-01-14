class Dose < ApplicationRecord
  validates :description, presence: true
  validates :cocktail, presence: true
  validates :description, presence: true, allow_blank: false
  validates :cocktail, uniqueness: { scope: :ingredient }
  belongs_to :cocktail
  belongs_to :ingredient
end
