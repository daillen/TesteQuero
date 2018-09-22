class Fatura < ApplicationRecord
  after_initialize :set_defaults

  def set_defaults
    @status ||= "Aberta"
  end

  belongs_to :matricula

  validates :valor, presence: true, numericality: {greater_than: 0}
  validates :vencimento, presence: true
  validates :status, presence: true, inclusion: %w(Aberta Atrasada Paga)
end
