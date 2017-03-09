module PermissionsConcern
	extend ActiveSupport::Concern
	def is_contador?
		self.contador = true
	end

	def is_estilista?
		self.estilista = true
	end
	
	def is_caja?
		self.caja = true
	end
	def is_admin?
		self.admin = true
	end

end