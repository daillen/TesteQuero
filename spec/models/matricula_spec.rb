require 'rails_helper'

RSpec.describe Matricula, :type => :model do
  let(:aluno) {Aluno.create(id: 1,
                            nome: 'AlunoTeste',
                            cpf: '123456789',
                            genero: 'M',
                            pagamento: "Boleto")}

  let(:instituicao) {Instituicao.create(id: 1,
                                        nome: 'Universidade de Taubaté',
                                        cnpj: '45176153000122',
                                        tipo: 'Universidade')}

  subject {described_class.new(valor_total: 50000.233,
                               qtd_faturas: 24,
                               vencimento_faturas: 10,
                               curso: 'Engenharia da Computação',
                               aluno_id: aluno.id,
                               instituicao_id: instituicao.id)}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without valor_total" do
    subject.valor_total = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with valor_total less than or equal to 0" do
    subject.valor_total = 0.0
    expect(subject).to_not be_valid

    subject.valor_total = -123.123
    expect(subject).to_not be_valid

    subject.valor_total = -0.01
    expect(subject).to_not be_valid
  end

  it "is not valid without qtd_faturas" do
    subject.qtd_faturas = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with qtd_faturas less than 1" do
    subject.qtd_faturas = 0
    expect(subject).to_not be_valid

    subject.qtd_faturas = -10
    expect(subject).to_not be_valid

    subject.qtd_faturas = -123123123
    expect(subject).to_not be_valid
  end

  it "is not valid without vencimento_faturas" do
    subject.vencimento_faturas = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with vencimento_faturas less than 1 or greater than 31" do
    subject.vencimento_faturas = 0
    expect(subject).to_not be_valid

    subject.vencimento_faturas = -1
    expect(subject).to_not be_valid

    subject.vencimento_faturas = 32
    expect(subject).to_not be_valid

    subject.vencimento_faturas = 123
    expect(subject).to_not be_valid
  end

  it "is not valid without a curso" do
    subject.curso = nil
    expect(subject).to_not be_valid
  end
end