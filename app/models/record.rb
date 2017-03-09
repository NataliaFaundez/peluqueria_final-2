class Record < ApplicationRecord
  belongs_to :client
  belongs_to :service
  belongs_to :user
  before_save :insert
  validates :service_id , presence: true
  validates :user_id , presence: true
  validates :client_id , presence: true

	def insert
		self.valor = Service.find(self.service_id).valor
		self.comision = self.valor*0.3
		
	end
end
