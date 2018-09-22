class Matricula < ApplicationRecord
  belongs_to :instituicao
  belongs_to :aluno

  has_many :faturas

  validates :valor_total, presence: true,
            numericality: {greater_than: 0}
  validates :qtd_faturas, presence: true,
            numericality: {greater_than_or_equal_to: 1}
  validates :vencimento_faturas, presence: true,
            numericality: {greater_than_or_equal_to: 1,
                           less_than_or_equal_to: 31}
  validates :curso, presence: true
end
