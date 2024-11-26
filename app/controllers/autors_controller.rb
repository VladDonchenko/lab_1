class AutorsController < ApplicationController
  def new
    @autor = Autor.new
  end

  def create
    @autor = Autor.new(autor_params)
    if @autor.save
      session[:autor_id] = @autor.id
      redirect_to root_url, notice: 'Thank you for signing up!'
    else
      render 'new'
    end
  end

  def profile
    @autor = current_autor
  end

  def save_profile
    @autor = current_autor
    @autor.update(autor_params)
    redirect_to profile_autors_path
  end

  def autor_params
    params.require(:autor).permit(:avatar, :first_name, :last_name, :autorname, :email, :password, :salt, :encrypted_password)
  end
end
