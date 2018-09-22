class Instituicao < ApplicationRecord
  validates :nome, presence: true, uniqueness: true
  validates :cnpj, presence: true, uniqueness: true, numericality: true
  validates :tipo, presence: true, inclusion: %w(Universidade Escola Creche)
end
