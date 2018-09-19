class Fatura < ApplicationRecord
  self.primary_key = :id

  belongs_to :matricula

  validates :valor, presence: true
  validates :vencimento, presence: true
  validates :matricula_id, presence: true
  validates :status, presence: true,
            inclusion: {in: %w('Aberta', 'Atrasada', 'Paga')}, default: 'Aberta'
end
