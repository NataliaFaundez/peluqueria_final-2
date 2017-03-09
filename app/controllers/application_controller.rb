class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configurar_strong_params, if: :devise_controller?

  $titulo = ''

  protected
  	def configurar_strong_params
  		devise_parameter_sanitizer.permit(:sign_up,keys:[:nombre,:apellido,:estado,:admin,:caja,:estilista,:contador,:porcentaje])
  	end

end
