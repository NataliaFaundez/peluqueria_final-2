class Inventary < ApplicationRecord
	
	validates :codigo,uniqueness: true
end
