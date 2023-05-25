Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    # これでトップを設定
    root 'top#index'
    # ブログのルーティング
    resources :blogs
end
