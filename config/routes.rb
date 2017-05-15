Rails.application.routes.draw do
  devise_for :admins
  get 'students/index'

  resources :cohorts do
    resources :teams
  end
  devise_for :students, :controllers => {:registration => 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :votes ,only: [:create, :index]

  get '/students', to: 'students#index'
  get '/students/:id', to: 'students#show', as: 'student'


    get '/admins/students/new', to: 'admins#student_new', as: 'new_student'
  post '/admins/students/new', to: 'admins#student_create', as:'create_student'
  get '/admins/students/:id/edit', to: 'admins#student_edit', as: 'edit_student'
  patch '/admins/students/:id', to: 'admins#student_update', as: 'update_student'
  put '/admins/students/:id', to: 'admins#student_update'

  resources :rounds
  resources :admins
  resources :pitches

  get '/' => 'static_pages#home'
end
