FactoryBot.define do
  factory :aluno do
      sequence(:nome) { |n| "Aluno_#{n}" }
      cpf { Faker::Number.number(11) }
      nascimento { Faker::Date.birthday(16, 65) }
      celular { Faker::Number.number(8) }
      genero { %w(M F).sample }
      pagamento { %w(Boleto Cartão).sample }
      email { Faker::Internet.email }
  end
end