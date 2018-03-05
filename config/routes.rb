Rails.application.routes.draw do
  devise_for :usuarios
  resources :roles
  resources :objetos
  get 'objetos/new'

  get 'objetos/create'

  get 'objetos/update'

  get 'objetos/edit'

  get 'objetos/destroy'

  get 'objetos/index'

  get 'objetos/show'

  resources :respuestas
  resources :juicios
  resources :actuaciones
  resources :instituciones
  resources :proceso_detalles
  resources :procesos
  resources :tipo_clientes
  resources :departamentos
  resources :ciudades
  resources :funciones
  resources :usuarios
  resources :clientes
  resources :empleados do
    get :autocomplete_empleado_ruc, :on => :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'listado/index', as: 'listado'
  get 'welcome/index'

  root :to => 'welcome#index'

  post 'juicios/cargar_select', as: 'cargar_select'
end
