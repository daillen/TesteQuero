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
    @aluno = Aluno.new(JSON.parse(request.body.read))
    if @aluno.save
      render json: @aluno, status: :ok
    else
      render json: {
          error: @aluno.errors.full_messages
      }, status: :unprocessable_entity
    end
  end
end
