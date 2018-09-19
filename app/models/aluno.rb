class Aluno < ApplicationRecord
  self.primary_key = :id

  validates :nome, presence: true, uniqueness: {case_sensitive: false}
  validates :cpf, presence: true, uniqueness: true, numericality: true
  validates :genero, presence: true, inclusion: %w(M F)
  validates :pagamento, presence: true, inclusion: %w(Boleto Cartão)
end
