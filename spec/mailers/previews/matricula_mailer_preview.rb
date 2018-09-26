# Preview all emails at http://localhost:3000/rails/mailers/matricula_mailer
class MatriculaMailerPreview < ActionMailer::Preview
  # http://localhost:3000/rails/mailers/matricula_mailer/matricula_email
  def matricula_email
    MatriculaMailer.matricula_email(Matricula.last)
  end
end
