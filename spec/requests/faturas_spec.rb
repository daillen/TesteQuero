require 'rails_helper'

RSpec.describe "GET /faturas", type: :request do
  let!(:faturas) { 10.times.map { |_| create :fatura } }

  it "returns all faturas with no parameters" do
    get '/faturas'
    body = JSON.parse(response.body)
    expect(body.size).to eq 10
  end

  it "returns a fatura with given id" do
    id = Fatura.last.id
    get "/faturas/#{id}"
    body = JSON.parse(response.body)
    expect(body['id']).to eq id
  end
end
