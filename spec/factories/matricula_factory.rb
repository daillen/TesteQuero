FactoryBot.define do
  factory :matricula do
    valor_total { Faker::Number.number(rand(4..6)) }
    qtd_faturas { Faker::Number.number(2) }
    vencimento_faturas { Faker::Number.between(1, 31) }
    curso { Faker::WorldOfWarcraft.hero }
    aluno
    instituicao
  end
end