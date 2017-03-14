class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :validar
	before_filter :configure_permitted_parameters, if: :devise_controller?
	$titulo = 'Usuarios'

	def index
		@users = User.where( :estado => true)
	end 

#  def ocultar
#	 @users = User.find(params[:id])
#	 @users.update_attributes(estado: false)
 # end
 

  
 # def destroy
  #    @users.destroy_user
   #   respond_to do |format|
    #      format.html { redirect_to users_url, notice: 'Estilista eliminado' }
     #     format.json { head :no_content }
      #   end
       #  end
  
# def destroy_user
 # self.update(:estado => false)
#end
 def destroy
     @usuario = User.find(params[:id])
     @usuario.update_attributes(estado: false)
    redirect_to usuarios_url
 
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
