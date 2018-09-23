FactoryBot.define do
  factory :fatura do
    valor { Faker::Number.number(rand(3..5)) }
    vencimento { Faker::Date.between(30.days.ago, Date.today) }
    matricula
    status { %w(Aberta Atrasada Paga).sample }
  end
end