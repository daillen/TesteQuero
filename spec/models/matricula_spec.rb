require 'rails_helper'

RSpec.describe Matricula, :type => :model do
  it "is valid with valid attributes" do
    matricula = create :matricula
    expect(matricula).to be_valid
  end

  context "validations" do
    it { is_expected.to validate_presence_of :valor_total }
    it { is_expected.to validate_numericality_of :valor_total }
    it { is_expected.to validate_presence_of :qtd_faturas }
    it { is_expected.to validate_numericality_of :qtd_faturas }
    it { is_expected.to validate_presence_of :vencimento_faturas }
    it { is_expected.to validate_numericality_of :vencimento_faturas }
    it { is_expected.to validate_presence_of :curso }
    it { is_expected.to belong_to :instituicao }
    it { is_expected.to belong_to :aluno }
    it { is_expected.to have_many :faturas }
  end
end