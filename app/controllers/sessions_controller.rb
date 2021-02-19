class SessionsController < ApplicationController
    def new
    end
  
    def create
      usuario = Usuario.find_by_email(params[:email])
      if usuario && usuario.authenticate(params[:password])
        session[:usuario_id] = usuario.id
        redirect_to root_url
        flash[:success] = "Inicio de sesión correcto, bienvenido " + usuario.nombre + "."
      else
        flash.now[:warning] = "El email o la contraseña es incorrecto."
        render "new"
      end
    end
  
    def destroy
      session[:usuario_id] = nil
      redirect_to root_url
      flash[:success] = "Sesión cerrada correctamente."
    end
  end
  