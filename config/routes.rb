Rails.application.routes.draw do

  resources :ensalamentos

  scope(path_names: { new: 'novo', edit: 'editar' }) do
    resources :predios
    resources :salas
    resources :periodos
    resources :usuarios
    resources :cursos do
      resources :disciplinas
    end
  end

  root 'index#index'

  get '/login', controller: 'index', action: 'login'
  post '/login', controller: 'index', action: 'logar'
  get '/logout', controller: 'index', action: 'logout'

end
