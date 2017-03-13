class Service < ApplicationRecord
	has_many :records
	validates :nombre,uniqueness: true
	 validates :nombre, :presence => {:message => "Usted debe ingresar un nombre"}, length: {minimum: 2, maximum: 50, :message => "El nombre debe tener entre 2 y 50 caracteres"}
  #validates :nombre, length: { in: 3..20 } no se necesita, ya esta validado el largo
  validates :nombre, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
  
  #validates :precio, :numericality => { :greater_than_or_equal_to => 0 }
  #se supone que es para los numeros positivos si funciona se elimina la de arriba 
  #y se deja la de abajo y se reemplaza todas las que sean numericas y si no queda la de arriba
  validates :valor, numericality: { :greater_than_or_equal_to => 0, message: "no se permiten números negativos"}
  validates :valor, numericality: {only_integer: true, message: "solo se permiten números enteros"}
  validates :valor, length: { in: 4..7, message: "el valor debe tener entre 4 y 7 caracteres"}
end
