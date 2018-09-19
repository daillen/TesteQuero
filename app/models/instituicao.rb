class Instituicao < ApplicationRecord
  self.primary_key = :id

  validates :nome, presence: true, uniqueness: true
  validates :cnpj, presence: true, uniqueness: true, numericality: true
  validates :tipo, presence: true,
            inclusion: {in: %w('Universidade', 'Escola', 'Creche')}
end
