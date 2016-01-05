Rails.application.routes.draw do


  get 'users/login' => 'sessions#new', as: :login
  post 'users/login' => 'sessions#create'
  delete 'users/logout' => "sessions#destroy", as: :logout


  root 'songs#index'


  get 'users' => 'users#index', as: :users
  get 'users/new' => 'users#new', as: :new_user
  post 'users' => 'users#create'
  get 'users/:id/edit' => 'users#edit', as: :edit_user
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy', as: :destroy_user
  get 'users/:id' => 'users#show', as: :user


  get 'songs' => 'songs#index', as: :songs
  get 'songs/:song_id' => 'songs#view', as: :view_song


  get 'about' => 'songs#about', as: :about
  get 'library' => 'songs#library', as: :library


  get 'users/:user_id/new' => 'songs#new', as: :user_songs # Why can't I use new_song
  post 'users/:user_id/new' => 'songs#create'
  get 'users/:user_id/:song_id/edit' => 'songs#edit', as: :user_song # Why can't I use edit_song
  patch 'users/:user_id/:song_id/edit' => 'songs#update'
  delete 'users/:user_id/:song_id' => 'songs#destroy', as: :destroy_song
  get 'users/:user_id/:song_id' => 'songs#show', as: :song


  get 'songs/:song_id/comments' => 'comments#index'
  get 'songs/:song_id/comments/new' => 'comments#new'
  post 'songs/:song_id' => 'comments#create', as: :song_comments
  get 'songs/:song_id/comments/:id/edit' => 'comments#edit'
  get 'songs/:song_id/comments/:id' => 'comments#show'
  patch 'songs/:song_id/comments/:id' => 'comments#update'
  delete 'songs/:song_id' => 'comments#destroy', as: :destroy_comment


  put 'like' => 'links#upvote'
  put 'dislike' => 'links#downvote'


end
