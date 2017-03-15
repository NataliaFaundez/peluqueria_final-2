class CommissionController < ApplicationController
  before_action :authenticate_user!
  before_action :validar
  $titulo = 'Comisiones' 

  def index
  	@users = User.all.order('estado DESC').where( :contador => false,:admin => false, :caja => false)
  
  end

  def employee
  	@total = 0
    if (params[:user_id] == nil)
      session[:user_id] = session[:user_id] 
    else
      session[:user_id] = params[:user_id] 
    end
  	@records = Record.where(:user_id =>session[:user_id] , :pagado => true)
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def pagar
    @record = Record.where( :user_id  => params[:user_id]).update_all( pagado: false)
    redirect_to inventaries_path
    #tb actualizar all comisiones, obtener por usuario y por all
  end
  
  private
   def record_params
      params.require(:record).permit(:pagado, :estado)
    end
    
    def validar
      if (current_user.admin or current_user.caja or current_user.contador)
        
        else
          redirect_to root_path 
        end
    end
end
