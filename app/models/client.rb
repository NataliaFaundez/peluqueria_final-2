class Client < ApplicationRecord
	has_many :records
	
	validates :rut,uniqueness: true, rut: true
	
end
