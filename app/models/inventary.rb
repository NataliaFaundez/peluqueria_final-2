class Inventary < ApplicationRecord
	
  validates :codigo,uniqueness: true
  validates :nombre, :presence => {:message => "Usted debe ingresar un nombre"}, length: {minimum: 2, maximum: 150, :message => "El nombre debe tener entre 2 y 150 caracteres"}
  #validates :nombre, length: { in: 3..20 } no se necesita, ya esta validado el largo
  validates :nombre, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
  
	# Validamos que el codigo, precio y stock solo sea numerico
  validates :codigo, numericality: { only_integer: true, :greater_than_or_equal_to => 0, message: "no se permiten números negativos"}
  validates :codigo, :presence => {:message => "Usted debe ingresar un codigo"}, length: {minimum: 2, maximum: 4, :message => "El codigo debe tener entre 2 y 4 caracteres"}

  # Validamos que el codigo de producto y producto sea unico
  validates :codigo, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}

  
  #validates :precio, :numericality => { :greater_than_or_equal_to => 0 }
  #se supone que es para los numeros positivos si funciona se elimina la de arriba 
  #y se deja la de abajo y se reemplaza todas las que sean numericas y si no queda la de arriba
  validates :precio, numericality: { :greater_than_or_equal_to => 0, message: "no se permiten números negativos"}
  validates :precio, numericality: {only_integer: true, message: "solo se permiten números enteros"}, length: {minimum: 3, maximum: 6, :message => "El precio debe tener entre 3 y 6 caracteres"}

  validates :cantidad, numericality: { only_integer: true, message: "solo se permiten números enteros"}
  validates :cantidad, numericality: {:greater_than_or_equal_to => 0, message: "no se permiten números negativos"}
	#el nombre del producto no tiene que ser solo letras, ya que hay productos con nombre de numeros o signos
  validates :cantidad, length: { in: 1..4, message: "la cantidad debe tener entre 1 y 4 caracteres"}
  validates :marca, length: { in: 1..50, message: "la marca debe tener entre 1 y 50 caracteres"}
  
  validates :vendidos, numericality: { only_integer: true, message: "solo se permiten números enteros"}
  validates :vendidos, numericality: {:greater_than_or_equal_to => 0, message: "no se permiten números negativos"}
  validates :vendidos, length: { in: 1..4, message: "la cantidad debe tener entre 1 y 4 caracteres"}
  
  validate :custom_validation_function

def custom_validation_function
  if self.vendidos > self.cantidad
      errors.add(:vendidos, "no puede ser mayor que cantidad")
      return false
  end
end
  
  def self.search(search)
    if search
      where('nombre LIKE ?', "%#{search}%") or where('marca LIKE ?', "%#{search}%")
    else
      where(nil)
    end
    
  end

end
