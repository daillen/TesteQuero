Rails.application.routes.draw do
  # Routes for alunos
  get "/alunos" => "alunos#index"
  get "/alunos/:id" => "alunos#show"
  post "/alunos" => "alunos#create"

  # Routes for instituicaos
  get "/instituicaos" => "instituicaos#index"
  get "/instituicaos/:id" => "instituicaos#show"
  post "/instituicaos" => "instituicaos#create"

  # Routes for matriculas

  # Routes for faturas
end
