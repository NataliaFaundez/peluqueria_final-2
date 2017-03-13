class InventariesController < ApplicationController
  before_action :authenticate_user!
  before_action :validar
  $titulo = 'Inventario'
  before_action :set_inventary, only: [:show, :edit, :update, :destroy]

  # GET /inventaries
  # GET /inventaries.json
  def index
    @inventaries = Inventary.all.order('created_at DESC')
    #@inventariesall = Inventary.order('created_at DESC')
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def excel

  end

  # GET /inventaries/1
  # GET /inventaries/1.json
  def show
  end

  # GET /inventaries/new
  def new
    @inventary = Inventary.new
  end

  # GET /inventaries/1/edit
  def edit
  end

  # POST /inventaries
  # POST /inventaries.json
  def create
    @inventary = Inventary.new(inventary_params)

    respond_to do |format|
      if @inventary.save
        format.html { redirect_to inventaries_path, notice: 'Producto Ingresado.' }
        format.json { render :show, status: :created, location: @inventary }
      else
        format.html { render :new }
        format.json { render json: @inventary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventaries/1
  # PATCH/PUT /inventaries/1.json
  def update
    respond_to do |format|
      if @inventary.update(inventary_params)
        format.html { redirect_to @inventary, notice: 'Inventario Actualizado' }
        format.json { render :show, status: :ok, location: @inventary }
      else
        format.html { render :edit }
        format.json { render json: @inventary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventaries/1
  # DELETE /inventaries/1.json
  def destroy
    @inventary.destroy
    respond_to do |format|
      format.html { redirect_to inventaries_url, notice: 'Producto Eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventary
      @inventary = Inventary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventary_params
      params.require(:inventary).permit(:nombre, :codigo, :cantidad, :precio, :estado, :marca)
    end
   def validar
      if (current_user.contador?)
        redirect_to root_path
      else current_user.estilista?
        if current_user.admin?
        elsif current_user.caja?
        else
          redirect_to root_path
        end
end
    end
end
