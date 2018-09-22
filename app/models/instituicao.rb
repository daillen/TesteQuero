class Instituicao < ApplicationRecord
  has_many :matriculas
  has_many :alunos, through: :matriculas

  validates :nome, presence: true, uniqueness: true
  validates :cnpj, presence: true, uniqueness: true, numericality: true
  validates :tipo, presence: true, inclusion: %w(Universidade Escola Creche)
end
