Rails.application.routes.draw do
  devise_for :users
    root    'posting#index'
    
    get     'posting'           =>  'posting#index'
    get     'posting/new'       =>  'posting#new'
    post    'posting'           =>  'posting#create'
    get     'users/:id'         =>  'users#show'
    delete  'posting/:id'       =>  'posting#destroy'
    get     'posting/:id/edit'  =>  'posting#edit'
    patch   'posting/:id'       =>  'posting#update'
    get     'posting/:id'       =>  'posting#show'

    resources :posting do
      resources :comments, only: [:create]
    end
    
    resources :posting do
      resources :likes, only: [:create, :destroy]
    end
end

# phpアドミン起動
# sudo service httpd start
# mysql起動
# sudo service mysqld start
# テストサーバー起動
# rails s -p $PORT -b $IP
# clr+cでサーバーシャットダウン
