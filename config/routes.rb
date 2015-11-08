Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root "articles#index"
end
