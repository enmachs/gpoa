Rails.application.routes.draw do
  localized do
  end

  root to: 'app/front#index'

  devise_for :users, skip: KepplerConfiguration.skip_module_devise

  namespace :admin do
    root to: 'admin#root'

    resources :responsables do
      get '(page/:page)', action: :index, on: :collection, as: ''
      get '/clone', action: 'clone'
      post '/import', action: 'import', as: :import

      get '/download', action: 'download', as: :download
      post(
        '/sort',
        action: :sort,
        on: :collection,
      )
      get(
        '/reload',
        action: :reload,
        on: :collection,
      )
      delete(
        '/destroy_multiple',
        action: :destroy_multiple,
        on: :collection,
        as: :destroy_multiple
      )
    end

    resources :tasks do
      get '(page/:page)', action: :index, on: :collection, as: ''
      get '/clone', action: 'clone'
      post '/import', action: 'import', as: :import

      get '/download', action: 'download', as: :download
      post(
        '/sort',
        action: :sort,
        on: :collection,
      )
      get(
        '/reload',
        action: :reload,
        on: :collection,
      )
      delete(
        '/destroy_multiple',
        action: :destroy_multiple,
        on: :collection,
        as: :destroy_multiple
      )
    end

    resources :operative_plans do
      get '(page/:page)', action: :index, on: :collection, as: ''
      get '/clone', action: 'clone'
      post '/import', action: 'import', as: :import
      get '/download', action: 'download', as: :download
      get '/poa', action: 'poa', as: :poa
      post(
        '/sort',
        action: :sort,
        on: :collection,
      )
      get(
        '/reload',
        action: :reload,
        on: :collection,
      )
      delete(
        '/destroy_multiple',
        action: :destroy_multiple,
        on: :collection,
        as: :destroy_multiple
      )
      resources :objectives do
        get '/new_task', to: 'objectives#new_task'
        get '/show_tasks', to: 'objectives#obj_tasks'
        post '/create_task', to: 'objetives#create_task'
        get '(page/:page)', action: :index, on: :collection, as: ''
        get '/clone', action: 'clone'
        post '/import', action: 'import', as: :import
        get '/download', action: 'download', as: :download
        post(
          '/sort',
          action: :sort,
          on: :collection,
        )
        get(
          '/reload',
          action: :reload,
          on: :collection,
        )
        delete(
          '/destroy_multiple',
          action: :destroy_multiple,
          on: :collection,
          as: :destroy_multiple
        )
      end
    end

    resources :customizes do
      get '(page/:page)', action: :index, on: :collection, as: ''
      get '/clone', action: 'clone'
      post '/import', action: 'import', as: 'import'
      post '/install_default', action: 'install_default'
      delete(
        action: :destroy_multiple,
        on: :collection,
        as: :destroy_multiple
      )
    end

    resources :users do
      get '(page/:page)', action: :index, on: :collection, as: ''
      get(
        '/reload',
        action: :reload,
        on: :collection
      )
      delete(
        '/destroy_multiple',
        action: :destroy_multiple,
        on: :collection,
        as: :destroy_multiple
      )
    end

    post '/sorting', to: 'meta_tags#sort', as: :sorting_meta_tags
    resources :meta_tags do
      get '(page/:page)', action: :index, on: :collection, as: ''
      get '/clone', action: 'clone'
      post '/import', action: 'import', as: 'import'
      get '/download', action: 'download', as: 'download'
      get(
        '/reload',
        action: :reload,
        on: :collection
      )
      delete(
        '/destroy_multiple',
        action: :destroy_multiple,
        on: :collection,
        as: :destroy_multiple
      )
    end

    resources :scripts do
      get '(page/:page)', action: :index, on: :collection, as: ''
      get '/clone', action: 'clone'
      post '/import', action: 'import', as: 'import'
      get '/download', action: 'download', as: 'download'
      get(
        '/reload',
        action: :reload,
        on: :collection
      )
      delete(
        '/destroy_multiple',
        action: :destroy_multiple,
        on: :collection,
        as: :destroy_multiple
      )
    end

    resources :settings, only: [] do
      collection do
        get '/:config', to: 'settings#edit', as: ''
        put '/:config', to: 'settings#update', as: 'update'
        put '/:config/appearance_default', to: 'settings#appearance_default', as: 'appearance_default'
      end
    end
  end

  # Errors routes
  match '/403', to: 'errors#not_authorized', via: :all, as: :not_authorized
  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  # Dashboard route engine
  mount KepplerGaDashboard::Engine, at: 'admin/dashboard', as: 'dashboard'

end
