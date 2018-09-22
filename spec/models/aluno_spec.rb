require 'rails_helper'

RSpec.describe Aluno, :type => :model do
  subject {described_class.new(nome: 'AlunoTeste',
                               cpf: '123456789',
                               genero: 'M',
                               pagamento: "Boleto")}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a nome" do
    subject.nome = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a cpf" do
    subject.cpf = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with a cpf which is not numeric" do
    subject.cpf = 'invalid'
    expect(subject).to_not be_valid

    subject.cpf = '123.456.789-10'
    expect(subject).to_not be_valid

    subject.cpf = '123456789 testing'
    expect(subject).to_not be_valid
  end

  it "is not valid without a genero" do
    subject.genero = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with an unvalid genero" do
    subject.genero = 'male'
    expect(subject).to_not be_valid

    subject.genero = 'female'
    expect(subject).to_not be_valid

    subject.genero = 'm'
    expect(subject).to_not be_valid
  end

  it "is not valid without a pagamento" do
    subject.pagamento = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with an unvalid pagamento" do
    subject.pagamento = 'dinheiro'
    expect(subject).to_not be_valid

    subject.pagamento = 'boleto'
    expect(subject).to_not be_valid

    subject.pagamento = 'Cartao'
    expect(subject).to_not be_valid
  end
end