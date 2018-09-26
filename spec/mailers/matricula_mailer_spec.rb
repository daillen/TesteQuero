require "rails_helper"

RSpec.describe MatriculaMailer, type: :mailer do
  before { @matricula = create :matricula }

  it 'should send an email' do
    MatriculaMailer.matricula_email(@matricula).deliver_now!
    expect(ActionMailer::Base.deliveries.count).to eq 1
  end

  it 'renders the receiver email' do
    my_mail = MatriculaMailer.matricula_email(@matricula).deliver_now!
    expect(my_mail.to).to eq [@matricula.aluno.email]
  end

  it 'renders the sender email' do
    my_mail = MatriculaMailer.matricula_email(@matricula).deliver_now!
    expect(my_mail.from).to eq ['billinho@billinho.com']
  end

  it 'should set the subject to the correct subject' do
    my_mail = MatriculaMailer.matricula_email(@matricula).deliver_now!
    expect(my_mail.subject).to eq "Matrícula na #{@matricula.instituicao.nome}"
  end
end
