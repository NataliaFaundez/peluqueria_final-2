class Service < ApplicationRecord
	has_many :records
	validates :nombre,uniqueness: true
end
