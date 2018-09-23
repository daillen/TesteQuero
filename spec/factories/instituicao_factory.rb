FactoryBot.define do
  factory :instituicao do
    sequence(:nome) { |n| "Instituicao_#{n}-#{Faker::OnePiece.quote}" }
    cnpj { Faker::Number.number(14) }
    tipo { %w(Universidade Escola Creche).sample }
  end
end