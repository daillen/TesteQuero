class MatriculaMailer < ApplicationMailer
  default from: 'billinho@billinho.com'

  def matricula_email(matricula)
    @matricula = matricula
    mail(to: @matricula.aluno.email, subject: "Matrícula na #{@matricula.instituicao.nome}")
  end
end
