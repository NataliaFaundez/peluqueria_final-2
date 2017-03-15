class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :records
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include PermissionsConcern
  
  validates_format_of :nombre, :with => /\A[a-zA-Z]+\z/
	validates :nombre, length: {minimum: 2, maximum: 50, :message => "El nombre debe tener entre 2 y 50 caracteres"}
	validates :nombre, :presence => {:message => "Usted debe ingresar un nombre"}
	validates :apellido, length: {minimum: 2, maximum: 50, :message => "El Apellido debe tener entre 2 y 50 caracteres"}
	validates :apellido, :presence => {:message => "Usted debe ingresar un Apellido"}
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/



end
