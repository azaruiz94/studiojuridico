class ApplicationController < ActionController::Base

  before_action :authenticate_usuario!, :except => [:some_action_without_auth]
  protect_from_forgery with: :exception

  layout 'admin_lte_2'

  #Sobreescribo este metodo porque mi path esta en espanhol y cancan usa current_user
  def current_ability
  @current_ability ||= Ability.new(current_usuario)
  end
  # Mensaje de error personalizado
  rescue_from CanCan::AccessDenied do |exception|
  	flash[:alert] = "Acceso denegado. No tienes autorización."
    redirect_to root_path
  end

end
