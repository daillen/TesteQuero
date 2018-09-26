require 'rails_helper'

RSpec.describe FaturaService do
  before(:all) { @service = FaturaService.new(dia_vencimento: 31,
                                              valor_total: 125000,
                                              qtd_faturas: 3,
                                              matricula_id: 1) }

  describe "#get_vencimentos" do
    it "returns incremental dates, increasing by months" do
      expected = [ Date.new(2018, 2, 28), Date.new(2018, 3, 31), Date.new(2018, 4, 30) ]
      @service.send(:get_vencimentos, Date.new(2018, 2, 10)).each_with_index do |date, i|
        expect(date).to eq expected[i]
      end
    end
  end

  describe "#get_valor_per_fatura" do
    it "returns the value rounded up to 2 decimal places" do
      expect(@service.send(:get_valor_per_fatura)).to eq 41666.67
    end

    it "must not round down when 3rd decimal digit is < 5" do
      @service.qtd_faturas = 24
      expect(@service.send(:get_valor_per_fatura)).to_not eq 5208.33
    end
  end
end