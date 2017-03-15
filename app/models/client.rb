class Client < ApplicationRecord
	has_many :records, dependent: :destroy
	
	validates_format_of :nombre, :with => /\A[a-zA-Z]+\z/
	validates :nombre, length: {minimum: 2, maximum: 50, :message => "El nombre debe tener entre 2 y 50 caracteres"}
	validates :nombre, :presence => {:message => "Usted debe ingresar un nombre"}
	validates :apellido, length: {minimum: 2, maximum: 50, :message => "El Apellido debe tener entre 2 y 50 caracteres"}
	validates :apellido, :presence => {:message => "Usted debe ingresar un Apellido"}
	validates :rut,uniqueness: true, rut: true
	validates :telefono, numericality: { :greater_than_or_equal_to => 0, message: "no se permiten telefono que partan con 0"}
  validates :telefono, numericality: {only_integer: true, message: "solo se permiten números enteros"}
  validates :telefono, length: {is: 9, message: "el valor debe tener 9 caracteres"}
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/



def self.search(search)
    if search
      where('rut LIKE ?', "%#{search}%")
    else
      where(nil)
    end
 end
	
end
