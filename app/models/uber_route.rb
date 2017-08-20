class UberRoute < ApplicationRecord
  has_and_belongs_to_many :destinations
  has_many :price_estimates
end
