class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :validar
	before_filter :configure_permitted_parameters, if: :devise_controller?
	$titulo = 'Usuarios'

	def index
		@users = User.all
	end 

def destroy

  end
		
  def nuevo
   	@nuevo_usuario = 1
   	respond_to do |format|
      format.html { sign_out_and_redirect(current_user)}
      format.json { head :no_content }
   	end
   end
   
	private
	
	
	def validar
      if (current_user.contador?)
        redirect_to root_path
      else (current_user.caja)
      	if(current_user.admin)
      	
      	else
      		redirect_to root_path
      	end
      end
    end
    
   
end
