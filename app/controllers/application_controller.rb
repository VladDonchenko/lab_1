class ApplicationController < ActionController::Base
  helper_method :current_autor
  helper_method :current_post
  helper_method :authorize

  def current_autor
    @current_autor ||= Autor.find(session[:autor_id]) if session[:autor_id]
  end
  helper_method :current_autor

  def authorize
    redirect_to login_url, alert: 'Not authorized' if current_autor.nil?
  end
end
