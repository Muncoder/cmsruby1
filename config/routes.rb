Rails.application.routes.draw do

	root to: redirect(Setting.where(key: "homepage").first.value)  

  	mount Ckeditor::Engine => '/ckeditor'

	resources :categories, only: [ :show ]
	resources :pages, only: [ :show ]

	namespace :admin do
  		resources :menus, except: [ :show ]
  		resources :pages   #admin/pages
		resources :categories
		resources :types, except: [ :show ]
  		get "settings" => "settings#index"
  		put "settings" => "settings#update"
	end	  

	Page.where.not("slug", nil).all.each do |page|
		get "/#{page.slug}", controller: "pages", action: "show", id: page.id
	end
	 
end