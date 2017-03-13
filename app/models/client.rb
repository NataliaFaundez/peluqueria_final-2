class Client < ApplicationRecord
	has_many :records
	validates :rut,uniqueness: true, rut: true
	validates :telefono, numericality: { :greater_than_or_equal_to => 0, message: "no se permiten telefono que partan con 0"}
  validates :telefono, numericality: {only_integer: true, message: "solo se permiten números enteros"}
  validates :telefono, length: {is: 9, message: "el valor debe tener 9 caracteres"}
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	
end
