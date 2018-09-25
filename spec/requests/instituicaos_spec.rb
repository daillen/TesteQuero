require 'rails_helper'

RSpec.describe "GET /instituicaos", type: :request do
  let!(:instituicaos) { create_list :instituicao, 10 }

  it "returns all instituicaos with no parameters" do
    get '/instituicaos'
    body = JSON.parse(response.body)
    expect(body.size).to eq 10
  end

  it "returns an instituicao with given id" do
    id = Instituicao.last.id
    get "/instituicaos/#{id}"
    body = JSON.parse(response.body)
    expect(body['id']).to eq id
  end
end

RSpec.describe "POST /instituicaos", type: :request do
  before { @instituicao = build :instituicao }
  let (:param) { { instituicao: @instituicao.serializable_hash } }

  it "creates a new instituicao" do
    expect { post "/instituicaos", params: param.to_json,
                  headers: { CONTENT_TYPE: "application/json" }
    }.to change(Instituicao, :count).by 1
  end
end
