class AlunosController < ApplicationController
  def index
    render json: Aluno.all
  end

  def show
    @aluno = Aluno.find(params[:id])
    render json: @aluno, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: {
        error: e.to_s
    }, status: :not_found
  end

  def create
    new_aluno = JSON.parse(request.body.read)
    @aluno = Aluno.new(nome: new_aluno["nome"],
                       cpf: new_aluno["cpf"],
                       nascimento: new_aluno["nascimento"],
                       celular: new_aluno["celular"],
                       genero: new_aluno["genero"],
                       pagamento: new_aluno["pagamento"])
    if @aluno.valid?
      @aluno.save
      render json: @aluno, status: :ok
    else
      render json: {
          error: "Given aluno is not a valid one!"
      }, status: :not_acceptable
    end
  end
end
