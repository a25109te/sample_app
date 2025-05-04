Rails.application.routes.draw do
  # GEt / => static_page#home
  root 'static_pages#home'

  # GEt /static_pages/home => static_pages#home
  # GET /about => static_pages#aboutの方が見やすい
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
end
