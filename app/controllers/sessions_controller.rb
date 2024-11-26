class SessionsController < ApplicationController
  def new; end

  def create
    autor = Autor.find_by_email(params[:email])
    if autor && autor.authenticate(params[:password])
      session[:autor_id] = autor.id
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now.alert = 'Email or password is invalid'
      render 'new'
    end
  end

  def destroy
    session[:autor_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
