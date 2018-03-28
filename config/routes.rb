Rails.application.routes.draw do
  resources :actividades
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
  get 'procesos/:id/print' => 'procesos#print', as: :print_proceso
  get 'juicios/:id/imprimir' => 'juicios#imprimir', as: :imprimir_juicio
  get 'actividades/:id/posponer' => 'actividades#posponer', as: :posponer_actividad
  #get 'procesos/report' => 'procesos#report', as: :report_procesos
  #et 'juicios/report' => 'juicio#report', as: :report_juicios
  root :to => 'welcome#index'

  post 'juicios/cargar_select', as: 'cargar_select'
  post 'ciudades/check_uniqueness', as: 'check_uniqueness'
  get 'json_response' => 'actividades#json_response', as: :json_response
end
