require 'rails_helper'

  RSpec.describe Instituicao, :type => :model do
    it "is valid with valid attributes" do
      instituicao = create :instituicao
      expect(instituicao).to be_valid
    end

    context "validations" do
      it { is_expected.to validate_presence_of :nome }
      it { is_expected.to validate_uniqueness_of(:nome).case_insensitive }
      it { is_expected.to validate_presence_of :cnpj }
      it { is_expected.to validate_uniqueness_of :cnpj }
      it { is_expected.to validate_numericality_of :cnpj }
      it { is_expected.to validate_presence_of :tipo }
      it { is_expected.to validate_inclusion_of(:tipo).in_array(%w(Universidade Escola Creche)) }
    end
  end