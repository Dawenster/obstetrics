Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root "articles#index"

  resources :articles do
    post "drag-update" => "articles#drag_update", as: :drag_update
  end
end
