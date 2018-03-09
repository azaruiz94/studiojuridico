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
  resources :juicios do
    collection do
      get 'report'
    end
  end
  resources :actuaciones
  resources :instituciones
  resources :proceso_detalles
  resources :procesos do
    collection do
      get 'report'
    end
  end
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
  get 'procesos/:id/print' => 'procesos#print', as: :print

  root :to => 'welcome#index'

  post 'juicios/cargar_select', as: 'cargar_select'
  post 'ciudades/check_uniqueness', as: 'check_uniqueness'
end
