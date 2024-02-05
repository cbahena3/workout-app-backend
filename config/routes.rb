Rails.application.routes.draw do
  #user routes
  get "/users" => "users#index"
  get "/users/:id" => "users#show"
  post "/users" => "users#create"
  patch "users/:id" => "users#update"
  delete "users/:id" => "users#destroy"

  #exercises routes
  get "/exercises" => "exercises#index"
  get "/exercises/:id" => "exercises#show"
  post "/exercises" => "exercises#create"
  patch "exercises/:id" => "exercises#update"
  delete "exercises/:id" => "exercises#destroy"

  #routine routes
  get "/routines" => "routines#index"
  get "/routines/:id" => "routines#show"
  post "/routines" => "routines#create"
  patch "routines/:id" => "routines#update"
  delete "routines/:id" => "routines#destroy"

  #used_muscles routes
  get "/used_muscles" => "used_muscles#index"
  get "/used_muscles/:id" => "used_muscles#show"
  post "/used_muscles" => "used_muscles#create"
  patch "used_muscles/:id" => "used_muscles#update"
  delete "used_muscles/:id" => "used_muscles#destroy"

  #muscle_groups routes
  get "/muscle_groups" => "muscle_groups#index"
  get "/muscle_groups/:id" => "muscle_groups#show"
  post "/muscle_groups" => "muscle_groups#create"
  patch "muscle_groups/:id" => "muscle_groups#update"
  delete "muscle_groups/:id" => "muscle_groups#destroy"

  #exercise_routines routes
  get "/exercise_routines" => "exercise_routines#index"
  get "/exercise_routines/:id" => "exercise_routines#show"
  post "/exercise_routines" => "exercise_routines#create"
  patch "exercise_routines/:id" => "exercise_routines#update"
  delete "exercise_routines/:id" => "exercise_routines#destroy"

  #sessions routes
  post "/sessions" => "sessions#create"
end
