Rails.application.routes.draw do
  resources :proceso_detalles
  resources :fases
  resources :tipo_procesos
  resources :procesos
  get 'welcome/index'

  resources :tipo_clientes
  resources :departamentos
  resources :ciudades
  resources :funciones
  resources :usuarios
  resources :clientes
  resources :empleados
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'welcome#index'

  post 'procesos/cargar_fases', as: 'cargar_fases'
end
