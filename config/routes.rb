Rails.application.routes.draw do
  get "/alunos" => "alunos#index"
  get "/alunos/:id" => "alunos#show"
  post "/alunos" => "alunos#create"
end
