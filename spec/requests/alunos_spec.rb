require 'rails_helper'

RSpec.describe "GET /alunos", type: :request do
  let!(:alunos) { 10.times.map { |_| create :aluno } }

  it "returns all alunos with no parameters" do
    get '/alunos'
    body = JSON.parse(response.body)
    expect(body.size).to eq 10
  end

  it "returns an aluno with given id" do
    id = Aluno.last.id
    get "/alunos/#{id}"
    body = JSON.parse(response.body)
    expect(body['id']).to eq id
  end
end

RSpec.describe "POST /alunos", type: :request do
  before { @aluno = build :aluno }
  let (:param) { { aluno: @aluno.serializable_hash } }

  it "creates a new aluno" do
    expect { post "/alunos", params: param.to_json,
                    headers: { CONTENT_TYPE: "application/json" }
    }.to change(Aluno, :count).by 1
  end
end
