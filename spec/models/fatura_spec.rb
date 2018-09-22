require 'rails_helper'

RSpec.describe Fatura, :type => :model do
  subject {Fatura.new(valor: 400.00, vencimento: Date.today, matricula_id: 1,
                      status: 'Paga')}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a valor" do
    subject.valor = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with a valor less than or equal to zero" do
    subject.valor = 0.0
    expect(subject).to_not be_valid

    subject.valor = -10.0
    expect(subject).to_not be_valid

    subject.valor = -0.0222
    expect(subject).to_not be_valid
  end

  it "is not valid with an unvalid status" do
    subject.status = 'pago'
    expect(subject).to_not be_valid

    subject.status = 'em aberto'
    expect(subject).to_not be_valid

    subject.status = 'nao pago'
    expect(subject).to_not be_valid
  end
end