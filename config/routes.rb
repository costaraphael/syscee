Rails.application.routes.draw do

  scope path_names: {new: 'solicitar', edit: 'efetuar'} do
    resources :ensalamentos do

      resources :sugestoes, only: [:index, :new, :create, :destroy], path_names: {new: 'novo'}

      collection do
        get 'solicitados'
        get 'abertos'
        get 'fechados'
      end
    end

    resources :reservas do
      collection do
        get 'solicitadas'
        get 'abertas'
        get 'fechadas'
      end
    end
  end

  scope path_names: {new: 'novo', edit: 'editar'} do
    scope 'ensalamentos/configuracao' do
      resources :predios, :salas, :periodos, except: :show
    end

    scope 'admin' do
      resources :usuarios, except: :show
    end

    resources :cursos, except: :show do
      resources :disciplinas, except: :show
    end

    resources :espacos
  end

  root 'index#index'

  get 'ensalamentos/relatorios/:periodo', controller: 'ensalamentos', action: 'relatorios', as: :relatorios

  get 'login', controller: 'index', action: 'login'
  post 'login', controller: 'index', action: 'logar'
  get 'logout', controller: 'index', action: 'logout'

  get '*path' => redirect('/')

end
