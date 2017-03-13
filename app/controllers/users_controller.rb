class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :validar
	before_filter :configure_permitted_parameters, if: :devise_controller?
	$titulo = 'Estilistas'

	def index
		@users = User.all
	end 

	

	private
	def validar
      if (current_user.contador?)
        redirect_to root_path
      else (current_user.caja)
      	if(current_user.admin?)
      	
      	else
      		redirect_to root_path
      	end
      end
    end
end
