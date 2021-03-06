Rails.application.routes.draw do
  # 顧客用
  scope module: :public do
    root to: 'homes#top'
  end
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  namespace :admin do
    resources :movies, only: [:new,:create,:index,:show,:edit,:update,:destroy]
  end
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
