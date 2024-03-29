ActionController::Routing::Routes.draw do |map|
  map.resources :modelos_de_notificacao

  map.resources :tipos_de_notificacao

  map.resources :repasses_fabrica

  map.resources :servicos

  map.resources :parametros_financeiros

  map.resources :tipos_de_documento

  map.resources :planos_de_conta

  map.resources :movimentos, :collection => {:contas_a_pagar => :get, :contas_pagas => [:get,:post], :contas_a_receber => :get, :contas_recebidas => [:get,:post]}

  map.resources :sub_depositarios

  map.resources :depositarios

  map.resources :descontos

  map.resources :arquivo_pagamentos, :collection => {:index => [:get,:post], :new => [:get, :post]}

  map.resources :valores_sistema

  map.resources :precos

  map.resources :selos

  map.resources :lotes

  map.resources :notificacoes, :collection => {:imprimir_notificacao => :get}

  map.resources :irtds

  map.resources :tribunais

  map.resources :conveniados

  map.resources :certidoes, :collection => {:solicitar => :get }

  map.resources :categorias

  map.resources :home, :collection  => {:testar => :post }
  map.resources :valor_campo_documentos

  map.resources :campo_documentos

  map.resources :documentos, :collection => {:verificar => [:get,:post] , :visualizar => [:get,:post]  }

  map.resources :tipo_documentos

  map.resources :campo_processos

  map.resources :processos

  map.resources :valor_campo_processos

  map.resources :tipo_campos

  map.resources :tipo_processos

  map.resources :mensagens

  map.resources :financeiro, :collection => {:index_gerar_faturas => :get, :conferencia_gerar_faturas => :post}

  map.resources :pessoas

  map.resources :configuracoes

  map.resources :motivo_notificacaos

  map.resources :administracao
  
  map.resources :cartorios

  map.resources :cidades

  map.resources :perfis_usuarios

  map.resources :perfis

  map.logout '/logout', :controller => 'contas', :action => 'destroy'
  map.login '/login', :controller => 'contas', :action => 'new'
  map.register '/register', :controller => 'usuarios', :action => 'create'
  map.signup '/signup', :controller => 'usuarios', :action => 'new'
  map.resources :usuarios, :collection => {:busca_nome => [:post], :search_usuario => [:post, :get]}

  map.resource :conta

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "site"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
