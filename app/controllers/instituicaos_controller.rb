class InstituicaosController < ApplicationController
  def index
    render json: Instituicao.all
  end

  def show
    @instituicao = Instituicao.find(params[:id])
    render json: @instituicao, status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: {
        error: e.to_s
    }, status: :not_found
  end

  def create
    @instituicao = Instituicao.new(get_params)
    if @instituicao.save
      render json: @instituicao, status: :ok
    else
      render json: {
          error: @instituicao.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def get_params
      params.require(:instituicao).permit(:nome, :cnpj, :tipo)
    end
end
