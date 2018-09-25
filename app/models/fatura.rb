class Fatura < ApplicationRecord
  belongs_to :matricula

  validates :valor, presence: true, numericality: {greater_than: 0}
  validates :vencimento, presence: true
  validates :status, presence: true, inclusion: %w(Aberta Atrasada Paga)
end
