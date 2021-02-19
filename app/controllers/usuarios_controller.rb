class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  
  
  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    if @usuario.save
      flash[:success] = "El usuario fue agregado correctamente."
      redirect_to @usuario
    else
      render 'new'
    end

=begin
    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'El usuario fue agregado correctamente.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    @usuario.image.purge
    @usuario.image.attach(usuario_params[:image])

    if @usuario.update(usuario_params)
      flash[:info] = "El usuario fue actualizado correctamente."
      redirect_to @usuario
    else
      render 'edit'
    end

=begin
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'El usuario fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    flash[:success] = "El usuario fue eliminado correctamente."
    redirect_to usuarios_url

=begin
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'El usuario fue eliminado correctamente.' }
      format.json { head :no_content }
    end
=end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:nombre, :apellidos, :datos, :email, :password)
    end

    def access
      rol = session[:usuario_rol].to_s.downcase
      if rol != "admin" || session[:usuario_id] == nil
        redirect_to root_url
      end
    end
end