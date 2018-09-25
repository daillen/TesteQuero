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
    @instituicao = Instituicao.new(JSON.parse(request.body.read))
    if @instituicao.save
      render json: @instituicao, status: :ok
    else
      render json: {
          error: @instituicao.errors.full_messages
      }, status: :not_acceptable
    end
  end
end
