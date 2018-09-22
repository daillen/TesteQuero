require 'rails_helper'

  RSpec.describe Instituicao, :type => :model do
    subject {described_class.new(nome: 'Universidade de Taubaté',
                                 cnpj: '45176153000122',
                                 tipo: 'Universidade')}

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a nome" do
      subject.nome = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a cnpj" do
      subject.cnpj = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with a cnpj which is not numeric" do
      subject.cnpj = 'invalid'
      expect(subject).to_not be_valid

      subject.cnpj = '45.176.153/0001-22'
      expect(subject).to_not be_valid

      subject.cnpj = '45176153000122 testing'
      expect(subject).to_not be_valid
    end

    it "is not valid without a tipo" do
      subject.tipo = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with an unvalid tipo" do
      subject.tipo = 'faculdade'
      expect(subject).to_not be_valid

      subject.tipo = 'universidade'
      expect(subject).to_not be_valid

      subject.tipo = 'ensino médio'
      expect(subject).to_not be_valid
    end
  end