class Aluno < ApplicationRecord
  has_many :matriculas
  has_many :faturas, through: :matriculas

  validates :nome, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :cpf, presence: true, uniqueness: true, numericality: true
  validates :genero, presence: true, inclusion: %w(M F)
  validates :pagamento, presence: true, inclusion: %w(Boleto Cartão)

  validates_format_of :email,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
