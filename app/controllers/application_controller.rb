class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configurar_strong_params, if: :devise_controller?

  $titulo = ''

  protected
  	def configurar_strong_params
  		devise_parameter_sanitizer.permit(:sign_up,keys:[:nombre,:apellido,:estado,:admin,:caja,:estilista,:contador,:porcentaje])
  	end
  	
  	private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    if @nuevo_usuario == 1
      new_user_registration_path
    else
      root_path
    end
  end

end
