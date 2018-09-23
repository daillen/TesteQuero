require 'rails_helper'

RSpec.describe Fatura, :type => :model do
  it "is valid with valid attributes" do
    fatura = create :fatura
    expect(fatura).to be_valid
  end

  context "validations" do
    it { is_expected.to validate_presence_of :valor }
    it { is_expected.to validate_presence_of :vencimento }
    it { is_expected.to validate_presence_of :status }
    it { is_expected.to validate_inclusion_of(:status).in_array(%w(Aberta Atrasada Paga)) }
    it { is_expected.to belong_to :matricula }
  end
end