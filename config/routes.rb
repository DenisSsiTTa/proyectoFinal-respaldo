Rails.application.routes.draw do
  resources :registrations
  devise_for :users, :path_prefix => 'my'
#TO-Do: personalizar los nombres de las rutas.
#devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

#Para administrar los usuarios
scope "/admin" do
  resources :users
  resources :groups
end


unauthenticated do
#paginas estaticas
  get 'pages/index'
  get 'pages/about'
  get 'pages/contact'
end

authenticated do
  get 'pages/index' => 'pages#index'
  get 'admin/groups' => 'groups#index'
  get 'registrations/:id/change_group' => 'registrations#change_group', as: :change_group_registration
  get 'admin/groups/:id/lista_alumnos' => 'groups#lista_alumnos', as: :lista_alumnos_groups
  get 'admin/groups/:id/imprimir_lista_alumnos' => 'groups#imprimir_lista_alumnos', as: :imprimir_lista_alumnos_groups
  
  post 'registrations/:id/confirm_registration' => 'registrations#confirm_registration',as: :confirm_registration
end

root to: "pages#index"

end
