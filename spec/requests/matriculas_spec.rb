require 'rails_helper'

RSpec.describe "GET /matriculas", type: :request do
  let!(:matriculas) { 10.times.map { |_| create :matricula } }

  it "returns all matriculas with no parameters" do
    get '/matriculas'
    body = JSON.parse(response.body)
    expect(body.size).to eq 10
  end

  it "returns an matricula with given id" do
    id = Matricula.last.id
    get "/matriculas/#{id}"
    body = JSON.parse(response.body)
    expect(body['id']).to eq id
  end
end

RSpec.describe "POST /matriculas", type: :request do
  before { @matricula = build :matricula }
  let (:param) { { matricula: @matricula.serializable_hash } }

  it "creates a new matricula" do
    expect { post "/matriculas", params: param.to_json, headers: { CONTENT_TYPE: "application/json" }}.to(
      change(Matricula, :count).by(1).and(
      change(Fatura, :count).by @matricula.qtd_faturas))
  end
end
