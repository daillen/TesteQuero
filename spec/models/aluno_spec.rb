require 'rails_helper'

RSpec.describe Aluno, :type => :model do
  it "is valid with valid attributes" do
    aluno = create :aluno
    expect(aluno).to be_valid
  end

  context "validations" do
    it { is_expected.to validate_presence_of :nome }
    it { is_expected.to validate_uniqueness_of(:nome).case_insensitive }
    it { is_expected.to validate_presence_of :cpf }
    it { is_expected.to validate_uniqueness_of :cpf }
    it { is_expected.to validate_numericality_of :cpf }
    it { is_expected.to validate_presence_of :genero }
    it { is_expected.to validate_inclusion_of(:genero).in_array(%w(M F)) }
    it { is_expected.to validate_presence_of :pagamento }
    it { is_expected.to validate_inclusion_of(:pagamento).in_array(%w(Boleto Cartão)) }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to allow_value("email@teste.com").for(:email) }
    it { is_expected.to_not allow_value("teste.com").for(:email) }
  end
end