Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
	root "admin/pages#home"

	resources :categories, only: [ :show ]
	resources :pages, only: [ :show ]

	namespace :admin do
  		resources :pages   #admin/pages
  		resources :categories
	end	  

	Page.where.not("slug", nil).all.each do |page|
		get "/#{page.slug}", controller: "pages", action: "show", id: page.id
	end


	 
end