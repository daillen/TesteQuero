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
    @aluno = Aluno.new(get_params)
    if @aluno.save
      render json: @aluno, status: :ok
    else
      render json: {
          error: @aluno.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def get_params
    params.require(:aluno).permit(:nome,
                                  :cpf,
                                  :email,
                                  :nascimento,
                                  :celular,
                                  :genero,
                                  :pagamento)
  end
end
