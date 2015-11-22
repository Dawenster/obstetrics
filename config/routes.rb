Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root "articles#index"

  resources :articles do
    post "drag-update" => "articles#drag_update", as: :drag_update
  end

  resources :major_sections, except: [:index, :show] do
    post "drag-update" => "major_sections#drag_update", as: :drag_update
  end

  resources :minor_sections, except: [:index, :show] do
    post "drag-update" => "minor_sections#drag_update", as: :drag_update
  end
end
