FactoryBot.define do
  factory :instituicao do
    nome { Faker::OnePiece.location }
    cnpj { Faker::Number.number(14) }
    tipo { %w(Universidade Escola Creche).sample }
  end
end